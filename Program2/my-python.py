import subprocess

subprocess.run(['terraform','fmt'],check=True)
subprocess.run(['terraform','init'],check=True)
subprocess.run(['terraform','plan'],check=True)
subprocess.run(['terraform','plan','--out=output'],check=True)
subprocess.run(['terraform','apply','output'],check=True)


