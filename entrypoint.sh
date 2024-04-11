#!/bin/sh -l

# Use INPUT_<INPUT_NAME> to get the value of an input
GREETING="Hello, $INPUT_WHO_TO_GREET!"

# Use workflow commands to do things like set debug messages
echo "::notice file=entrypoint.sh,line=7::$GREETING"

# Write outputs to the $GITHUB_OUTPUT file
echo "time=$(date)" >>"$GITHUB_OUTPUT"

pwd
ls -la
ls -la /app
python3 /app/main.py --api_key=$API_KEY --ecosystem=$ECOSYSTEM --client_name=$CLIENT_NAME --project=$PROJECT_NAME