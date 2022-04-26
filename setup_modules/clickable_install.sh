#!/bin/bash

echo ""
echo "Installing clickable-ut running: pip3 install --user clickable-ut"
pip3 install --user clickable-ut
clear
echo ""
echo "Adding pip Scripts To Our PATH"
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
echo "clickable-ut Is Installed. Close This Terminal And Open A New One, Then Run: clickable setup . To Download The Docker Images."
echo ""
echo "Bye Bye!"
exit