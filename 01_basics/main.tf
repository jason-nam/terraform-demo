# simple file resource

resource "local_file" "tf_example_1" {
  # filename = "01_basics/example_1.txt"
  filename = "${path.module}/example_1.txt"
  content = "new content"
}

resource "local_sensitive_file" "tf_example_2" {
  filename = "${path.module}/example_2.txt"
  content  = "sensitive content"
}