class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @categories = Category.includes(:deals).where(author: @user)
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params.merge(author: @user))
    respond_to do |format|
      format.html do
        if category.save
          flash[:success] = 'New Category added'
          redirect_to categories_path
        else
          flash.now[:error] = 'Error: Category could not be added'
          render :new
        end
      end
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = 'Category successfully deleted'
    redirect_to categories_path
  end

  private

  def set_user
    @user = current_user
  end

  def category_params
    params.require('category').permit(:name, :icon)
  end
end
