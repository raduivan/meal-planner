resource "google_project_service" "required" {
  for_each = toset([
    "firebase.googleapis.com",
    "firestore.googleapis.com",
    "identitytoolkit.googleapis.com",
    "run.googleapis.com",
    "cloudfunctions.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "appengine.googleapis.com"
  ])

  project = "meal-planner-474313"
  service = each.key
}

resource "google_firebase_web_app" "web" {
  provider     = google-beta
  display_name = "Meal Planner Web"
  project      = "meal-planner-474313"
  depends_on   = [google_project_service.required]
}

data "google_firebase_web_app_config" "web" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.web.app_id
}

output "firebase_api_key" {
  value = data.google_firebase_web_app_config.web.api_key
}

output "firebase_auth_domain" {
  value = data.google_firebase_web_app_config.web.auth_domain
}

output "firebase_project_id" {
  value = "meal-planner-474313"
}

output "firebase_app_id" {
  value = google_firebase_web_app.web.app_id
}
