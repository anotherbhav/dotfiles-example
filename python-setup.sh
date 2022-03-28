#!/usr/bin/env bash

# upgrade pip
# pip would show up in the pip3 list below, but we should upgrade it prior
pip3 install --upgrade pip setuptools

# upgrade all pip packages
pip3 list | cut -d' ' -f1 | egrep -v '(Package|----)' | xargs pip3 install --upgrade

# tool for generating csvs from json and working with CSV files
pip3 install csvkit