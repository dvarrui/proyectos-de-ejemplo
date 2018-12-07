class TagController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
  end
end
