#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### SELinux policy
# Custom module allowing steamos-manager's log-submitter to write tracefs,
# and bootupd to read /proc. Without this, steamos-manager fails to start
# and Game Mode never loads.
semodule -i /usr/share/selinux/packages/steamos-local.pp
