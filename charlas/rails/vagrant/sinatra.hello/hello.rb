require "sinatra/base"

class HelloWorld < Sinatra::Base
  #set :bind, '172.31.99.172'
  #set :port, 9494

  get '/' do
    erb :index
  end

  get '/hello' do
    erb :hello
  end

  get '/iam/:name' do
    "Hello #{params['name']}!"
  end
end

HelloWorld.run!
