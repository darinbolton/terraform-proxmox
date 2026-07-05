locals {
  name_prefix = "${var.environment}-"
  common_tags = ["managed-by-terraform", "env-${var.environment}"]
}