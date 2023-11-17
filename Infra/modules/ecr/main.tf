resource "aws_ecr_repository" "service" {
  for_each             = local.repositories
  force_delete         = null
  image_tag_mutability = each.value.image_tag_mutability
  name                 = "${local.env}-${each.value.name}"
  tags                 = {}
  tags_all             = {}
  encryption_configuration {
    encryption_type = "AES256"
    kms_key         = null
  }
  image_scanning_configuration {
    scan_on_push = each.value.scan_on_push
  }
}

resource "aws_ecr_lifecycle_policy" "service" {
  for_each   = local.repositories
  policy     = "{\"rules\":[{\"action\":{\"type\":\"expire\"},\"description\":\"Delete more than ${each.value.image_count} images\",\"rulePriority\":1,\"selection\":{\"countNumber\":${each.value.image_count},\"countType\":\"imageCountMoreThan\",\"tagStatus\":\"any\"}}]}"
  repository = "${local.env}-${each.value.name}"
  depends_on = [aws_ecr_repository.service]
}
