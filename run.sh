#!/bin/bash

npm install
bower cache clean --allow-root
bower install --allow-root
gulp
