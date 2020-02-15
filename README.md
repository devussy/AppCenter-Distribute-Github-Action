# App Center Distribute Github Action

This action uploads artefacts (.apk or .ipa) to Visual Studio App Center.

## Inputs

### `app`

**Required** App name followed by username e.g. `wzieba/Sample-App`

### `token`

**Required** Upload token - you can get one from appcenter.ms/settings

### `group`

**Required** Additional Distribution group (Collaborators always default)

### `file`

**Required** Artefact to upload (.apk or .ipa)

### `releaseNotes`

Release notes visible on release page

### `silent`

Flag to determine whether notify testers of this release or not (true/false)

**Default** true


## Example usage

```
name: Build, code quality, tests 

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: build release 
      run: ./gradlew assembleRelease
    - name: App Center Distribute
      uses: devussy/AppCenter-Distribute-Github-Action@v1.0.5
      with:
        app: devussy/SampleApp
        token: ${{secrets.APP_CENTER_TOKEN}}
        group: TargetGroup
        file: path to apk
        silent: false
```
