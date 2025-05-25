import subprocess
import json

def get_mullvad_status():
    args = ["mullvad", "status", "--json"]
    vpn_info = subprocess.check_output(args).decode().strip()
    return json.loads(vpn_info)

def get_vpn_state():
    mullvad_status = get_mullvad_status()
    vpn_state = mullvad_status["state"]
    return vpn_state

try:
    out = {}
    vpn_state = get_vpn_state()
    out["class"] = vpn_state
    out["tooltip"] = vpn_state.capitalize()
    print(json.dumps(out))
except:
    print("")

