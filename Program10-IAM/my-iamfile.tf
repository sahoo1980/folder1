provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  region      = "us-central1"
  zone        = "us-central1-a"
}

resource "google_project_iam_member" "my-new-iam-member_editor" {
  project = "learned-vault-387908"
  member  = "user:bidyut1@gmail.com"
  role = "roles/editor"  
}
resource "google_project_iam_member" "my-new-iam-member_owner" {
  project = "learned-vault-387908"
  member  = "user:bidyut1@gmail.com"
  role = "roles/owner"  
}

resource "google_iap_web_iam_binding" "my-new-iam-binding" {
      project = "learned-vault-387908"
role = "roles/editor"
members = [ "user:bidyut1@gmail.com" , "user:bidyut2@gmail.com"]  
}
