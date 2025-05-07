import subprocess

def is_song_playing():
    args = ["playerctl", "--player=spotify", "status"]
    status = subprocess.check_output(args, stderr=subprocess.DEVNULL).decode().strip()
    return status == "Playing"

def get_song_info():
    args = ["playerctl", "--player=spotify", "metadata", "--format", "{{ artist }} | {{ title }}"]
    return subprocess.check_output(args).decode().strip()

try:
    if is_song_playing():
        print(get_song_info())
    else:
        print("")
except:
    print("")
