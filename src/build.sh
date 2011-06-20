#!/bin/bash
cp -r ./i18n ../../
coffee -w -c -o ../js/ ./ui/*/*.coffee ./controller/*.coffee
