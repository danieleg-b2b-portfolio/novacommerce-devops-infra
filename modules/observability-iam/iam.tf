# --- LOKI S3 POLICY ---
data "aws_iam_policy_document" "loki_s3" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = [
      var.loki_bucket_arn,
      "${var.loki_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "loki_s3_policy" {
  name   = "${var.cluster_name}-loki-s3-policy"
  policy = data.aws_iam_policy_document.loki_s3.json
}

# --- MIMIR S3 POLICY ---
data "aws_iam_policy_document" "mimir_s3" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = [
      var.mimir_bucket_arn,
      "${var.mimir_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "mimir_s3_policy" {
  name   = "${var.cluster_name}-mimir-s3-policy"
  policy = data.aws_iam_policy_document.mimir_s3.json
}

# --- TEMPO S3 POLICY ---
data "aws_iam_policy_document" "tempo_s3" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = [
      var.tempo_bucket_arn,
      "${var.tempo_bucket_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "tempo_s3_policy" {
  name   = "${var.cluster_name}-tempo-s3-policy"
  policy = data.aws_iam_policy_document.tempo_s3.json
}