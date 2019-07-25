#!/bin/bash
#Progress bar on terminal screen

progress_bar() {
    local progressbar_max = ${1:-30}
    local progressbar_delay = ${2:-1}
    local progressbar_todo = ${3:-"-"}
    local progressbar_done = ${4:-">"}
    local i

    echo -en "["
    for i in `seq 1 $progressbar_max`
        do
        echo -en "$progressbar_todo"
        done
  # 1) "]" to end loading bar
  # 2) "[" (to replace the original "[" and put the cursor in the right place)
    echo -en "]\0015["
    for i in `seq 1 $progressbar_max`
        do
        echo -en "$progressbar_done"
        sleep ${progressbar_delay}
        done
    echo
}

while :
    do
        curl http://localhost/status 2>/dev/null | grep "Ready" && break
        echo "`date`: System is not ready. Checking again.."
        progress_bar 10
        done
    echo "`date`: System is ready."