#!/usr/bin/env bash

sudo sed -i "s/%U$/%U --enable-features=WebUIDarkMode --force-dark-mode/" /usr/share/applications/google-chrome.desktop
