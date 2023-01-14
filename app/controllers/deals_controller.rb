class DealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @category = Category.find(params[:category_id])
    @deals = @category.deals.order('created_at DESC')
  end

  def new
    @deal = Deal.new
    @categories = Category.all
  end

  def create
    deal = Deal.new(deal_params.merge(author: @user))
    respond_to do |format|
      format.html do
        if deal.save
          categories = params[:deal][:category].reject!(&:empty?)
          categories = categories.map { |cat| Category.find(cat) }
          add_category_deal(categories, deal)
        else
          flash[:error] = 'Error: Deal could not be added'
          redirect_to new_category_deal_path
        end
      end
    end
  end

  def add_category_deal(categories, deal)
    if categories.empty?
      deal.destroy
      flash[:error] = 'Error: Category not selected! Select a category'
      redirect_to new_category_deal_path
    else
      categories.each do |category|
        cat_deal = CategoryDeal.new(category:, deal:)
        flash[:success] = 'New CategoryDeal added' if cat_deal.save
      end
      redirect_to category_deals_path
    end
  end

  def destroy
    deal = deal.find(params[:id])
    deal.destroy
    flash[:success] = 'Deal successfully deleted'
    redirect_to deals_path
  end

  private

  def set_user
    @user = current_user
  end

  def deal_params
    params.require('deal').permit(:name, :amount, :category)
  end
end
