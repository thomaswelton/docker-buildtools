#!/bin/bash

cd /var/www/laravel

bundle install
npm install

gulp
