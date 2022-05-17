#!/bin/bash

cd ~/kb

bash-scripting/autogenerate.sh "python scripting" "py" "python" > auto-python.md
bash-scripting/autogenerate.sh "bash scripting" "sh" "bash" > auto-bash.md
bash-scripting/autogenerate.sh "awk scripting" "awk" "awk" > auto-awk.md
