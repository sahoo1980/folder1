terraform {
  backend "gcs" {
    #bucket      = "my-nw-remotestate"
    bucket      = "artifacts.learned-vault-387908.appspot.com"
    prefix      = "terraform/mystate"
    credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  }
}