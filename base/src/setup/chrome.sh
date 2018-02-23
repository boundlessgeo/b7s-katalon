#!/usr/bin/env bash

set -xe

echo "Install Google Chrome"

package='google-chrome.deb'

if [[ -v CHROME_DEB_URL ]]; then
  url=$CHROME_DEB_URL
else
  url=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi

wget -O $package  $url
dpkg -i $package || apt-get install -y -f
rm $package

wrapper_path=$(readlink -f /usr/bin/google-chrome)
base_path="$wrapper_path-base"
mv "$wrapper_path" "$base_path"

cat > "$wrapper_path" <<_EOF
#!/bin/bash

# Note: exec -a below is a bashism.
exec -a "\$0" "$base_path" --no-sandbox "\$@"
_EOF
chmod +x "$wrapper_path"

echo "$(google-chrome -version)" >> $KATALON_VERSION_FILE
