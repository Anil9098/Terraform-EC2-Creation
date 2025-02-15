resource "aws_s3_bucket" "s3_bucket" {
	bucket = "data-ki-bucket"
	
	tags = {
	Name = "date_bucket"
}
}
