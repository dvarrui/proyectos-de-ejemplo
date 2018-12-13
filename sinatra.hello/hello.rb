require "sinatra/base"

class HelloWorld < Sinatra::Base

  get '/' do
    "HelloWorld!"
  end

end

HelloWorld.run!
