import aws_cdk as cdk
from stacks.hello_constructs_stack import HelloConstructsStack

app = cdk.App()
HelloConstructsStack(app, "hello-constructs-stack")

app.synth()
