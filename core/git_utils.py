import subprocess


# auto add all changes
def auto_add_all():
    subprocess.run(["git", "add", "."], stdout=subprocess.PIPE, stderr=subprocess.PIPE)


# get staged changes
def get_staged_diff():
    result = subprocess.run(
        ["git", "diff", "--cached"], 
        stdout=subprocess.PIPE, 
        stderr=subprocess.PIPE, 
        text=True
    )
    
    return result.stdout.strip()


# commit with message
def commit_changes(message):
    result = subprocess.run(["git", "commit", "-m", message])
    
    return result.returncode == 0