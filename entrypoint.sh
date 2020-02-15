#!/bin/sh

is_silent=$INPUT_SILENT
if [ $is_silent = true ] ; then
  appcenter distribute release --token "$INPUT_TOKEN" --app "$INPUT_APP" --group "Collaborators" --file "$INPUT_FILE" --release-notes "$INPUT_RELEASENOTES" --debug --silent

  latest_version="$(appcenter distribute releases list --token "$INPUT_TOKEN" --app "$INPUT_APP"  | grep ID | head -1| tr -s ' ' | cut -f2 -d ' ')"
  appcenter distribute releases add-destination --token "$INPUT_TOKEN" --app "$INPUT_APP" --destination "$INPUT_GROUP" -t group -r "$latest_version" --silent
else
  appcenter distribute release --token "$INPUT_TOKEN" --app "$INPUT_APP" --group "Collaborators" --file "$INPUT_FILE" --release-notes "$INPUT_RELEASENOTES" --debug

  latest_version="$(appcenter distribute releases list --token "$INPUT_TOKEN" --app "$INPUT_APP"  | grep ID | head -1| tr -s ' ' | cut -f2 -d ' ')"
  appcenter distribute releases add-destination --token "$INPUT_TOKEN" --app "$INPUT_APP" --destination "$INPUT_GROUP" -t group -r "$latest_version"
fi

