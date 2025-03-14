locals {
  ### Yandex Cloud credentials
  yandex_provider = {
    # token     = get_env("YC_TOKEN")
    zone      = get_env("YC_ZONE", "ru-central1-d")
    # folder_id = get_env("YC_FOLDER_ID")
    # cloud_id  = get_env("YC_CLOUD_ID")
  }

  ### S3 backend credentials
  s3_backend = {
    # access_key = get_env("ACCESS_KEY")
    # secret_key = get_env("SECRET_KEY")
    bucket     = "harmony"
    region     = "ru-central1"
  }

  k8s_service_account_id = "ajem53hmt5rh08bbllh8"
}