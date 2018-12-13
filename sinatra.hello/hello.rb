require "sinatra/base"

class SinatraFrontEnd < Sinatra::Base

  get '/' do
    "Hola Mundo!"
    #render 'hola'
  end

end

SinatraFrontEnd.run!
