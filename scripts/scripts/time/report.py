import os
from datetime import datetime

file = os.path.expanduser("~/.local/share/time/data/work")

total_sec = 0

with open(file) as f:
    for line in f:

        date_str_start = line[00:25]
        dt_start = datetime.fromisoformat(date_str_start)

        try:
            date_str_end = line[26:51]
            dt_end = datetime.fromisoformat(date_str_end)
        except IndexError:
            dt_end = datetime.now()

        sec = (dt_end - dt_start).total_seconds()
        total_sec += sec

hours = total_sec / 3600
print(f"{hours:.2f} h")
