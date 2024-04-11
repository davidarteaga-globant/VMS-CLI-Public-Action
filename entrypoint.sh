#!/bin/sh -l

# Use INPUT_<INPUT_NAME> to get the value of an input
GREETING="Hello, $INPUT_WHO_TO_GREET!"

# Use workflow commands to do things like set debug messages
echo "::notice file=entrypoint.sh,line=7::$GREETING"

# Write outputs to the $GITHUB_OUTPUT file
echo "time=$(date)" >>"$GITHUB_OUTPUT"

echo 1
echo $GITHUB_WORKSPACE
pwd
ls -la


mkdir /app/scan_folder
cp -r $GITHUB_WORKSPACE /app/scan_folder 

cd /app
python3 main.py --api_key=$API_KEY --ecosystem=$ECOSYSTEM --client_name=$CLIENT_NAME --project=$PROJECT_NAME