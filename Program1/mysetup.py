import subprocess

subprocess.run(['terraform','fmt'],check=True)
subprocess.run(['terraform','init'],check=True)
subprocess.run(['terraform','plan'],check=True)
subprocess.run(['terraform','apply','--auto-approve'],check=True)
#subprocess.run(['terraform','apply'],check=True)