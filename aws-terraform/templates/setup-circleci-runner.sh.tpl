
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

# Start runner service
sudo systemctl enable circleci-runner
sudo systemctl start circleci-runner

# Check status (use || true to prevent failure)
sudo systemctl status circleci-runner || true
