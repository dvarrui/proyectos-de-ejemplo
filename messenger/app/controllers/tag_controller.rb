
class TagController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "Tag #{@tag.name} created!"
      redirect_to @tag
    else
      render 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      # Handle a successful update.
      flash[:success] = "Tag #{@tag.name} created!"
      redirect_to @tag
    else
      render 'edit'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end

=begin
  def create
    @tag = Tag.new(params[:tag])
     if @tag.save
         redirect_to @tag, alert: "User created successfully."
     else
         redirect_to new_tag_path, alert: "Error creating user."
     end
  end
=end
