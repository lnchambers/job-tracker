class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    if @tag.save
      flash[:success] = "#{@tag.title} updated!"
      redirect_to tag_path(@tag)
    else
      render :edit
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy

    flash[:success] = "#{tag.title} was successfully deleted!"
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end