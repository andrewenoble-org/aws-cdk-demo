from aws_cdk import RemovalPolicy, Stack
from aws_cdk import aws_apigateway as apigw
from aws_cdk import aws_dynamodb as ddb
from aws_cdk import aws_lambda as _lambda
from aws_solutions_constructs import aws_apigateway_lambda as apigw_lambda
from aws_solutions_constructs import aws_lambda_dynamodb as lambda_ddb
from constructs import Construct


class HelloConstructsStack(Stack):
    def __init__(self, scope: Construct, id: str, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        self.hello_func = _lambda.Function(
            self,
            "HelloHandler",
            runtime=_lambda.Runtime.PYTHON_3_9,
            handler="hello.handler",
            code=_lambda.Code.from_asset("lambda"),
        )

        #  hit counter, aws-lambda-dynamodb pattern
        self.hit_counter = lambda_ddb.LambdaToDynamoDB(
            self,
            "LambdaToDynamoDB",
            lambda_function_props=_lambda.FunctionProps(
                runtime=_lambda.Runtime.PYTHON_3_9,
                code=_lambda.Code.from_asset("lambda"),
                handler="hitcounter.handler",
                environment={
                    "DOWNSTREAM_FUNCTION_NAME": self.hello_func.function_name,
                },
            ),
            dynamo_table_props=ddb.TableProps(
                table_name="SolutionsConstructsHits",
                partition_key={
                    "name": "path",
                    "type": ddb.AttributeType.STRING,
                },
                removal_policy=RemovalPolicy.DESTROY,
            ),
        )

        # grant the hitcounter lambda role invoke permissions to the hello function
        self.hello_func.grant_invoke(self.hit_counter.lambda_function)

        apigw_lambda.ApiGatewayToLambda(
            self,
            "ApiGatewayToLambda",
            existing_lambda_obj=self.hit_counter.lambda_function,
            api_gateway_props=apigw.RestApiProps(
                default_method_options=apigw.MethodOptions(
                    authorization_type=apigw.AuthorizationType.NONE,
                ),
            ),
        )
