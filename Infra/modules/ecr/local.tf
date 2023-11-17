locals {
  env = "stg"
  repositories = {
    moribus-navi-fe = {
      name                 = "moribus-navi-fe"
      image_count          = 5
      image_tag_mutability = "IMMUTABLE"
      scan_on_push         = true
    }
    moribus-navi-be = {
      name                 = "moribus-navi-be"
      image_count          = 5
      image_tag_mutability = "IMMUTABLE"
      scan_on_push         = true
    }
  }
}
