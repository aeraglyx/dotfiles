import os
import json
import html

file_in = os.path.expanduser("~/projects/bookmarks/bookmarks.json")
path_color_hex = "#525252"

def walk(node, path=None):

    if path is None:
        path = []

    if "url" in node:

        name = node["name"]
        if not name:
            name = f"[ {node["url"]} ]"

        path_str = ""
        if path:
            delimiter = " / "
            path_str = delimiter.join(path) + delimiter
            path_str = f"<span foreground='{path_color_hex}'>{path_str}</span>"

        name = html.escape(name)
        full_path_str = path_str + name + " " + node["url"]
        print(full_path_str)

    elif "children" in node:
        new_path = path + [node["name"]]
        for child in node["children"]:
            walk(child, new_path)

with open(file_in) as f:
    data = json.load(f)

for node in data:
    walk(node)

