#!/usr/bin/env bash

set -e

# Install ansible and git if not installed yet.
which ansible 2>/dev/null || { sudo apt-get install -y -q ansible; }
which git 2>/dev/null || { sudo apt-get install -y -q git; }

ansible-galaxy install -r ansible/roles/requirements.yml --roles-path ./ansible/roles

ansible-playbook ansible/_post-system-install.yml --ask-become-pass