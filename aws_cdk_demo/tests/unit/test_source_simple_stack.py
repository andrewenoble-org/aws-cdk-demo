import aws_cdk as core
import aws_cdk.assertions as assertions
from aws_cdk_demo.stacks.hello_constructs_stack import HelloConstructsStack


def test_hello_constructs_stack():
    app = core.App()
    stack = HelloConstructsStack(app, "hello-constructs-stack")
    template = assertions.Template.from_stack(stack)

    template.has_resource_properties("AWS::Lambda::Function", {
        "Runtime": "python3.9"
    })
