#!/usr/bin/env bash

supervisorctl reread
supervisorctl update
supervisorctl restart all
service nginx restart
