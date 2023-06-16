provider "google" {
  credentials = "D:\\Papa\\MyPrograms\\my-key.json"
  project     = "learned-vault-387908"
  zone        = "us-central1-a"
}

resource "google_bigquery_dataset" "my-first-dataset" {
  dataset_id = ""
  project    = "learned-vault-387908"
}

resource "google_bigquery_table" "my-first-table" {
  dataset_id = google_bigquery_dataset.my-first-dataset_id
  table_id   = ""
  project    = "learned-vault-387908"
  schema     = <<EOF
[
    {
        "name": "customer_id"
        "type": "STRING"
        "mode": "REQUIRED"
    }
    ,
    {
        "name": "purchase_count"
        "type": "INTEGER"
        "mode": "NULL"
    }
]
EOF
}