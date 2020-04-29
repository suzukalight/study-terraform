# 基本操作

## リソースの作成

**main.tf の作成**

```tf
provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c3fd0f5d33134a76"
  instance_type = "t3.micro"
}
```

**初期化・実行計画の作成・計画の反映**

```bash
$ terraform init

Initializing the backend...
...
Terraform has been successfully initialized!
```

```bash
$ terraform plan

Plan: 1 to add, 0 to change, 0 to destroy.
```

```bash
$ terraform apply
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.example: Creating...
aws_instance.example: Still creating... [10s elapsed]
aws_instance.example: Still creating... [20s elapsed]
aws_instance.example: Creation complete after 23s [id=i-09ec16e28f8cf3ab7]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

## リソースの更新

**main.tf を更新**

```tf
provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c3fd0f5d33134a76"
  instance_type = "t3.micro"

  user_data = <<EOF
  #!/bin/bash
  yum install -y httpd
  systemctl start httpd.service
EOF
}
```

**プランの反映**

```bash
$ terraform apply
aws_instance.example: Refreshing state... [id=i-09ec16e28f8cf3ab7]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.example: Destroying... [id=i-09ec16e28f8cf3ab7]
aws_instance.example: Still destroying... [id=i-09ec16e28f8cf3ab7, 10s elapsed]
aws_instance.example: Still destroying... [id=i-09ec16e28f8cf3ab7, 20s elapsed]
aws_instance.example: Still destroying... [id=i-09ec16e28f8cf3ab7, 30s elapsed]
aws_instance.example: Destruction complete after 40s
aws_instance.example: Creating...
aws_instance.example: Still creating... [10s elapsed]
aws_instance.example: Still creating... [20s elapsed]
aws_instance.example: Creation complete after 28s [id=i-0ff6b0bfda3e2e9e0]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```

## リソースの削除

```bash
$ terraform destroy

aws_instance.example: Refreshing state... [id=i-0ff6b0bfda3e2e9e0]

...

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.example: Destroying... [id=i-0ff6b0bfda3e2e9e0]
aws_instance.example: Still destroying... [id=i-0ff6b0bfda3e2e9e0, 10s elapsed]
aws_instance.example: Still destroying... [id=i-0ff6b0bfda3e2e9e0, 20s elapsed]
aws_instance.example: Still destroying... [id=i-0ff6b0bfda3e2e9e0, 30s elapsed]
aws_instance.example: Still destroying... [id=i-0ff6b0bfda3e2e9e0, 40s elapsed]
aws_instance.example: Still destroying... [id=i-0ff6b0bfda3e2e9e0, 50s elapsed]
aws_instance.example: Still destroying... [id=i-0ff6b0bfda3e2e9e0, 1m0s elapsed]
aws_instance.example: Destruction complete after 1m0s

Destroy complete! Resources: 1 destroyed.
```
