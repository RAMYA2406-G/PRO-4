#!/bin/bash

# SELinux Access Denial Practical
# Student Name:
# Register Number:

echo "===== SELinux Status ====="
sestatus

echo "===== Creating Web Directory ====="
mkdir -p /var/www/html/selinux
echo "===== Creating HTML File ====="
echo "SELinux Access denial Practical" > /var/www/selinux/index.html

echo "===== Setting Linux Permissions ====="
chmod 755 /var/www/html/selinux
chmod 644 /var/www/html/selinux/index.html

echo "===== Checking Initial Context ====="
ls -Z /var/www/html/selinux/index.html

echo "===== Assigning Wrong SELinux Context ====="
chcon -t user_home_t /var/www/html/selinux/index.html
echo "===== Checking Wrong Context ====="
ls -Z /var/www/html/selinux/index.html

echo "===== Checking AVC Denials ====="
ausearch -m AVC -ts recent

echo "===== Correcting SELinux Context ====="
restorecon -v /var/www/html/selinux/index.html

echo "===== Checking Correct Context ====="
ls -Z /var/www/html/selinux/index.html

echo "===== Practical Completed ====="
