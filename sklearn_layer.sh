#!/bin/bash

# Check if S3 bucket parameter is provided
if [ $# -eq 0 ]; then
    echo "Error: S3 bucket parameter is required."
    echo "Usage: $0 <s3-bucket-name>"
    exit 1
fi

S3_BUCKET=$1

python3 -m venv sklearn_layer
source sklearn_layer/bin/activate

sudo yum update -y
sudo yum install -y python3-devel python3-pip gcc
pip install --upgrade pip
pip install numpy==1.26 scikit-learn==1.4.2 pandas

mkdir -p python/lib/python3.10/site-packages
cp -r sklearn_layer/lib/python3.10/site-packages/* python/lib/python3.10/site-packages/

find python -name "*.pyc" -delete
find python -name "__pycache__" -type d -exec rm -r {} +
find python -name "tests" -type d -exec rm -r {} +
find python -name "datasets" -type d -exec rm -r {} +
find python -type d -name "*.dist-info" | xargs -r rm -r
find python -type d -name "tests" | xargs -r rm -r
find python -type d -name "test" | xargs -r rm -r
find python -type d -name "testing" | xargs -r rm -r

zip -r9 sklearn_1.4.2.zip python

aws s3 cp sklearn_1.4.2.zip s3://${S3_BUCKET}/
