
#!/bin/bash

curl -s https://packagecloud.io/install/repositories/circleci/runner/script.deb.sh?any=true | sudo bash

apt-get install -y circleci-runner

sed -i "s/<< AUTH_TOKEN >>/${cci_runner_token}/g" /etc/circleci-runner/circleci-runner-config.yaml
systemctl enable circleci-runner && systemctl start circleci-runner

# Check status
systemctl status circleci-runner
