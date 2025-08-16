module "kms_key_example" {
  source          = "../"
  alias_name      = "mi-llave-de-prueba"
  key_description = "Llave de prueba para el ejemplo"
}
