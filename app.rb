require 'sinatra'
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
      "href": "url/session/#{fake_token}",
      "rel": "self"
    }
  }.to_json
end

delete '/session' do
  "OK"
end

get '/session/:token' do
  halt 500, "Invalid credentials" unless params[:token] == fake_user[:token]

  {
    "token": fake_token,
    "user": fake_user,
    "link": {
      "href": "url/session/#{fake_token}",
      "rel": "self"
    }
  }.to_json
end

post '/session/:token' do
  "OK"
end

delete '/session/:token' do
  "OK"
end