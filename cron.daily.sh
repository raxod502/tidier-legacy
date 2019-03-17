#!/usr/bin/env bash

set -e
set -o pipefail

time="$(date +%I:%M)"

if [[ "$1" != "-f" ]] && ! [[ "$time" > "05:30" && "$time" < "06:30" ]]; then
    echo "exiting as it is not 6am or 6pm; pass -f to override" 1>&2
    exit 1
fi

for repo in radian straight.el el-patch prescient.el blackout diary-manager; do
        java -jar no-carrier.jar "raxod502/$repo" "waiting on response" 90
done

# Notify that we finished. Radon gets an email if this code doesn't
# run at least once per day.
if [[ -n "$TIDIER_SNITCH" ]]; then
    curl https://nosnch.in/4b2cd645fc
fi
