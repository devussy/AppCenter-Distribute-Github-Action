#!/bin/sh

is_silent=$INPUT_SILENT
if [ $is_silent = true ] ; then
  appcenter distribute release --token "$INPUT_TOKEN" --app "$INPUT_APP" --group "$INPUT_GROUP" --file "$INPUT_FILE" --release-notes "$INPUT_RELEASENOTES" --debug --silent
else
  appcenter distribute release --token "$INPUT_TOKEN" --app "$INPUT_APP" --group "$INPUT_GROUP" --file "$INPUT_FILE" --release-notes "$INPUT_RELEASENOTES" --debug
fi

