import subprocess

def build_docker_image():
    subprocess.run(["docker", "build", "-t", "my-image:latest", "."], check=True, cwd="D:\\Papa\\MyPrograms\\My-Terraform\\Program7")

def push_docker_image_to_gcr():
    subprocess.run(["gcloud", "auth", "configure-docker"], check=True)
    subprocess.run(["docker", "tag", "my-image:latest", "gcr.io/learned-vault-387908/my-folder/my-image:latest"], check=True)
    subprocess.run(["docker", "push", "gcr.io/learned-vault-387908/my-folder/my-image:latest"], check=True)

def deploy_with_terraform():
    subprocess.run(["terraform", "init"], check=True)
    subprocess.run(["terraform", "apply", "-auto-approve"], check=True)

def main():
    build_docker_image()
    push_docker_image_to_gcr()
    deploy_with_terraform()

if __name__ == "__main__":
    main()
