#!/bin/bash

pgrep -f 'quickshell.*powermenu' | grep -v $$ > /dev/null || quickshell --config ~/.config/quickshell/powermenu/