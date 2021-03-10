class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(
      :name, :text, :category_id, :status_id, :delivery_fee_id, :prefectures_id, :days_to_ship_id, :price, :image, :genre_id
    )
          .merge(user_id: current_user.id)
  end
end
