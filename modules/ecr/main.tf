resource "aws_ecr_repository" "repos" {
  for_each = toset(var.repositories)

  name                 = "novacommerce-${each.value}"
  image_tag_mutability = "MUTABLE"

  # Sicurezza: Scansione CVE automatica ad ogni push dell'immagine Docker
  image_scanning_configuration {
    scan_on_push = true
  }

  # Crittografia a riposo gestita da AWS
  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = var.tags
}

# Policy di pulizia automatica per ottimizzare i costi di storage su ECR
resource "aws_ecr_lifecycle_policy" "cleanup_policy" {
  for_each   = aws_ecr_repository.repos
  repository = each.value.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Elimina immagini senza tag dopo 14 giorni"
        selection = {
          tagStatus   = "untagged"
          countType   = "sinceImagePushed"
          countUnit   = "days"
          countNumber = 14
        }
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2
        description  = "Conserva solo gli ultimi 15 tag rilasciati"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 15
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}