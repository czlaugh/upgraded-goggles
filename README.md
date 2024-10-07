# Create an independent scikit-learn layer in AWS Lambda in two-steps

This project is designed to help create a standakone [AWS Lambda](https://aws.amazon.com/pm/lambda/) layer which can be used to support N AWS Lambda functions.
To learn more about scikit-learn, [visit](https://scikit-learn.org/stable/)

As tested, the script installs scikit-learn version 1.4.2 from a python 3.10 environment.

Procedure

1. run sklearn_layer.sh, providing a S3 bucket as a command-line parameter.
2. [AWS Cloud Formation](https://aws.amazon.com/cloudformation/) is used to create the layer.  You will be prompted for the location and name of the supporting ZIP file.  Visit the [AWS console](https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/create), and create the stack using the provided YAML. Take care to install the stack in your preferred AWS region.

