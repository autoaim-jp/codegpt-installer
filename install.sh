#!/bin/bash

set -euxo pipefail
cd "$(dirname "$0")"

sudo whoami

sudo mkdir -p /opt/codegpt/bin/
cd /opt/codegpt/bin/
sudo chown ${USER}: -R ./

wget https://github.com/appleboy/CodeGPT/releases/download/v0.10.0/CodeGPT-0.10.0-linux-amd64
mv CodeGPT-0.10.0-linux-amd64 /opt/codegpt/bin/codegpt
chmod +x /opt/codegpt/bin/codegpt

cat<<"EOF" >> ~/.bashrc
export CODEGPT_INSTALL="/opt/codegpt/"
export PATH="$CODEGPT_INSTALL/bin:$PATH"
EOF

export CODEGPT_INSTALL="/opt/codegpt/"
export PATH="$CODEGPT_INSTALL/bin:$PATH"

codegpt version

