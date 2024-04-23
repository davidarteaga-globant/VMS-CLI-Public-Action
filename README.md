# VMS CLI docker action

This action executes a VMS scan using the CLI. Results are going to be uploaded into the VMS Platform when the scan is finished.
The action can be integrated in any Github workflow since is this action is public.

## Inputs

## `client_name`

**Required** The client name that was created previously on VMS Platform.

## `project_name`

**Required** The name of the project that was created previously on VMS Platform and associated with the client.

## `ecosystem`

**Required** The name of the ecosystem that was created previously on VMS Platform and associated with the clients project.

## `api_key`

**Required** The API Key provided by VMS Platform that allow the CLI use the VMS API and upload the results. Note that in the example this variable was stored in the Environment Secrets called "test" as a good security practice.

## Outputs

## `time`

The time that VMS CLI scan was executed.

## Example usage

```
on:
  pull_request:
    types: [opened, reopened, edited, synchronize]

jobs:
  VMS-CLI-SCAN:
    runs-on: ubuntu-latest
    name: VMS CLI Scan job
    environment: test
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
      - name: Get VMS-CLI action and perform scan
        id: vms-cli
        uses: davidarteaga-globant/VMS-CLI-Public-Action@main
        with:
          client_name: 'Dev' #Example client name, replace it.
          project_name: 'Test' #Example project name, replace it.
          ecosystem: 'vms-cli' #Example ecosystem, replace it.
          api_key: ${{ secrets.VMS_API_KEY }}
      - name: Get the output time of scanning start
        run: echo "The time was ${{ steps.vms-cli.outputs.time }}"
```
