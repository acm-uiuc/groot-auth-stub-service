# groot-auth-stub-service

[![Build Status](https://travis-ci.org/acm-uiuc/groot-auth-stub-service.svg?branch=master)](https://travis-ci.org/acm-uiuc/groot-auth-stub-service)

## Requirements
- This service is only to be used locally to replace crowd functionality.
- `http://locahost:8008` must be listed as the "AuthURL" in the Groot API Gateway
- This user will not have have any admin, corporate, top4, etc access.

## Setup / Usage

1. `bundle install`
2. `ruby app.rb`