# セットアップ

## プロフィールの作成

```bash
$ aws configure --profile suzukalight

AWS Access Key ID [None]: <Your Key>
AWS Secret Access Key [None]: <Your Key>
Default region name [None]: ap-northeast-1
Default output format [None]: json
```

```bash
$ export AWS_PROFILE=suzukalight
$ aws sts get-caller-identity
{
    "UserId": xxxx,
    "Account": xxxx,
    "Arn": xxxx
}
```

## terraform とバージョンマネージャのインストール

```bash
$ brew install tfenv
🍺  /usr/local/Cellar/tfenv/1.0.2: 20 files, 29.2KB, built in 3 seconds

$ tfenv -v
tfenv 1.0.2

$ tfenv list-remote
0.12.24

$ tfenv install 0.12.24
[INFO] Installing Terraform v0.12.24
...
[INFO] Switching completed
```

```bash
$ docker pull hashicorp/terraform:0.12.24
0.12.24: Pulling from hashicorp/terraform
...
docker.io/hashicorp/terraform:0.12.24

$ docker run --rm hashicorp/terraform:0.12.24 --version
Terraform v0.12.24
```
