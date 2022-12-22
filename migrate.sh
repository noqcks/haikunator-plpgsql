#!/bin/sh

schemaVersionTable=version_schema
functionsVersionTable=version_functions

echo "- Loading function.."
cd function
tern status --config $TERN_CONF --version-table $functionsVersionTable | grep "version:  1 of 1"
if [ $? -eq 0 ]; then
    tern migrate --config $TERN_CONF --version-table $functionsVersionTable --destination -+1
else
    tern migrate --config $TERN_CONF --version-table $functionsVersionTable
fi
if [ $? -ne 0 ]; then exit 1; fi
echo "Done"
