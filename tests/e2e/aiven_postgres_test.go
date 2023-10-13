package test

import (
	"context"
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/jackc/pgx/v4"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAivenPostgres(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../../examples/postgres",
		EnvVars: map[string]string{
			"AIVEN_TOKEN": os.Getenv("AIVEN_TOKEN"),
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	databaseName := terraform.Output(t, terraformOptions, "database_name")
	databaseConnectionUrl := FetchSensitiveOutput(t, terraformOptions, "database_url")

	assert.Equal(t, databaseName, "test")

	fmt.Println("Checking that database connection works...")
	conn, err := pgx.Connect(context.Background(), databaseConnectionUrl)
	assert.NoError(t, err)

	var result string
	err = conn.QueryRow(context.Background(), "SELECT 'Hello, world!'").Scan(&result)
	assert.NoError(t, err)
	assert.Equal(t, "Hello, world!", result)

	err = conn.Close(context.Background())
	assert.NoError(t, err)
}

func FetchSensitiveOutput(t *testing.T, options *terraform.Options, name string) string {
	defer func() {
		options.Logger = nil
	}()
	options.Logger = logger.Discard
	return terraform.Output(t, options, name)
}
