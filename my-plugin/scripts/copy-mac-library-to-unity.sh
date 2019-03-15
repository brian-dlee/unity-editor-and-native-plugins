#!/bin/sh

#
#  Note: This script should not be ran directly. It's executed during the XCode build phase for the Mac library
#

root=$(pwd | sed -E 's!my-plugin(/.*)?!native-plugin-unity-example!')

if [[ ! -e "$root" ]]; then
    echo "Failed to locate the repo for library installation! The directory \"$root\" does not exist." >&2
    exit 1
fi

dest="$root/Assets/Plugins/MacOS/$WRAPPER_NAME"
bundle="${BUILD_DIR}/${CONFIGURATION}/${WRAPPER_NAME}"

if [[ ! -e "$dest" ]]; then
    mkdir -p "$dest"
fi

rsync -avzHL --delete --exclude '*.meta' "$bundle/" "$dest/"

frameworks_dir="$dest/Contents/Frameworks"

for framework in $(find ${PODS_BUILD_DIR}/${CONFIGURATION} -type d -regex '.*\.framework'); do
  rsync -avzHL --delete --exclude '*.meta' "$framework" "$frameworks_dir"
done
