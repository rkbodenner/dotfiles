# Claude / Bedrock helper function
claude-bedrock() {
        CLAUDE_CODE_USE_BEDROCK=1 AWS_REGION=us-west-2 claude "$@"
}
