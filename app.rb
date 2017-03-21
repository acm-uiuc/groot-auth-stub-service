# Copyright © 2017, ACM@UIUC
#
# This file is part of the Groot Project.  
# 
# The Groot Project is open source software, released under the University of
# Illinois/NCSA Open Source License. You should have received a copy of
# this license in a file with the distribution.

require 'sinatra'
require 'json'

set :port, 8008

fake_token = "this-is-a-fake-token"
fake_user = {
    "first-name": "Mr. Fake",
    "last-name": "User",
    "name": "jsmith2",
    "email": "jsmith2@illinois.edu"
}

post '/session' do
  {
    "token": fake_token,
    "user": {
      "link": {
        "href": "#{request.base_url}/user?username=#{fake_user[:name]}",
        "rel": "self"
      },
      "name": fake_user[:name]
    },
    "link": {
      "href": "#{request.base_url}/session/#{fake_token}",
      "rel": "self"
    }
  }.to_json
end

delete '/session' do
  {
    "message": "OK"
  }.to_json
end

get '/session/:token' do
  halt 500, {"error" => "Invalid token provided"}.to_json unless params[:token] == fake_token

  {
    "token": fake_token,
    "user": fake_user,
    "link": {
      "href": "#{request.base_url}/session/#{fake_token}",
      "rel": "self"
    }
  }.to_json
end

post '/session/:token' do
  {
    "message": "OK"
  }.to_json
end

delete '/session/:token' do
  {
    "message": "OK"
  }.to_json
end