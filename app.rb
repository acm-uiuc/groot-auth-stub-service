require 'sinatra'
require 'json'

set :port, 8008

fake_token = "this-is-a-fake-token"
fake_user = {
    "first-name": "John",
    "last-name": "Smith",
    "name": "jsmith2",
    "email": "jsmith2@illinois.edu"
}

post '/session' do
  {
    "token": fake_token,
    "user": {
      "link": {
        "href": "url/user?username=#{fake_user[:name]}",
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
  halt 500, "Invalid credentials" unless params[:token] == fake_token

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