// tests/s3_bucket_test.go
package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestS3BucketModule(t *testing.T) {
	t.Parallel()

	// Define Terraform options
	terraformOptions := &terraform.Options{
		// Path to the Terraform code that will be tested
		TerraformDir: "../modules/wizardai_aws_s3_bucket",

		// Variables to pass to our Terraform code using the terraform.tfvars file
    Vars: map[string]interface{}{
			"name": "example",
			"environment": "development",
  	},
		
		// Set AWS region
		EnvVars: map[string]string{
			"AWS_REGION": "ap-southeast-2",
		},
}

	// Clean up resources with "terraform destroy" at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply"
	terraform.InitAndApply(t, terraformOptions)

	// Run test checks (e.g., ensure bucket name is correctly set)
	bucketID := terraform.Output(t, terraformOptions, "name")
	assert.Equal(t, bucketID, "example-bucket")
}