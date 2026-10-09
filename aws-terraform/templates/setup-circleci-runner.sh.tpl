#!/bin/bash
set -e  # Exit on any error

# Wait for apt locks to be released
while sudo fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do
    echo "Waiting for apt locks..."
    sleep 5
done

# Install CircleCI runner
curl -s https://packagecloud.io/install/repositories/circleci/runner/script.deb.sh?any=true | sudo bash
sudo apt-get install -y circleci-runner

# Configure runner token
sudo sed -i "s/<< AUTH_TOKEN >>/${cci_runner_token}/g" /etc/circleci-runner/circleci-runner-config.yaml
%{ if server ~}
# CircleCI Server: write api.url beside auth_token. This block is omitted when server is false.
tmp_config="$(mktemp)"
sudo awk '
  { print }
  /auth_token:/ && !done { print "  url: ${trimspace(server_url)}"; done = 1 }
' /etc/circleci-runner/circleci-runner-config.yaml | sudo tee "$tmp_config" >/dev/null
sudo mv "$tmp_config" /etc/circleci-runner/circleci-runner-config.yaml
%{ endif ~}

# Start runner service
sudo systemctl enable circleci-runner
sudo systemctl start circleci-runner

# Check status (use || true to prevent failure)
sudo systemctl status circleci-runner || true
