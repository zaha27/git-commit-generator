import os
import json


CONFIG_FILE = os.path.expanduser("~/.gcmconfig")


# default settings
DEFAULT_CONFIG = {
    "llm_model": "mistral",
    "auto_commit": False,
    "auto_git_add": False
}


# load config from file
def load_config():
    if not os.path.exists(CONFIG_FILE):
        return DEFAULT_CONFIG

    try:
        with open(CONFIG_FILE, "r") as f:
            return json.load(f)
    except Exception:
        return DEFAULT_CONFIG


# save config to file
def save_config(config_data):
    try:
        with open(CONFIG_FILE, "w") as f:
            json.dump(config_data, f, indent=4)
            
        return True
    except Exception as e:
        print(f"[ERROR] Could not save config: {e}")
        return False