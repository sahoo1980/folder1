import subprocess

subprocess.run(["terraform","fmt"], check=True)
subprocess.run(["terraform","init"], check=True)
subprocess.run(["terraform","plan","-out=outputplan"], check=True)
subprocess.run(["terraform","apply","-auto-approve","outputplan"], check=True)