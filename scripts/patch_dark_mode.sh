#!/bin/sh

# A simple script for patching SVGs exported from draw.io with dark mode support.
#
# The CSS template was taken from:
#   https://github.com/jgraph/drawio-github/blob/cfcaff1457862dad9095c1057fce78c955ae742e/DARK-MODE.md

set -e

if [ -z "$1" ]; then
  >&2 echo "USAGE:"
  >&2 echo "  patch_dark_mode.sh /path/to/svg/file"
  exit 1
fi

sed -i 's/<defs\/>/<defs><style type="text\/css">@media (prefers-color-scheme: dark) {:root {--light-color: #c9d1d9;--dark-color: #0d1117;}svg[style^="background-color:"] {background-color: var(--dark-color) !important;}g[filter="url(#dropShadow)"] {filter: none !important;}[stroke="rgb(0, 0, 0)"] {stroke: var(--light-color);}[stroke="rgb(255, 255, 255)"] {stroke: var(--dark-color);}[fill="rgb(0, 0, 0)"] {fill: var(--light-color);}[fill="rgb(255, 255, 255)"] {fill: var(--dark-color);}g[fill="rgb(0, 0, 0)"] text {fill: var(--light-color);}div[data-drawio-colors*="color: rgb(0, 0, 0)"] div {color: var(--light-color) !important;}div[data-drawio-colors*="border-color: rgb(0, 0, 0)"] {border-color: var(--light-color) !important;}div[data-drawio-colors*="border-color: rgb(0, 0, 0)"] div {border-color: var(--light-color) !important;}div[data-drawio-colors*="background-color: rgb(255, 255, 255)"] {background-color: var(--dark-color) !important;}div[data-drawio-colors*="background-color: rgb(255, 255, 255)"] div {background-color: var(--dark-color) !important;}}<\/style><\/defs>/g' $1
