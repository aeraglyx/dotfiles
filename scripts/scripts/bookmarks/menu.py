import os
import json

file_in = os.path.expanduser("~/projects/bookmarks/bookmarks.json")

def walk(node, path=None):

    if path is None:
        path = []

    if "url" in node:

        name = node["name"]
        if not name:
            name = f"[ {node["url"]} ]"

        path_str = ""
        if path:
            path_str = " / ".join(path) + " / "
            path_str = f"<span foreground='#525252'>{path_str}</span>"

        print(path_str + name + " " + node["url"])

    elif "children" in node:
        new_path = path + [node["name"]]
        for child in node["children"]:
            walk(child, new_path)

with open(file_in) as f:
    data = json.load(f)

for node in data:
    walk(node)

