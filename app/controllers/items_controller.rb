class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    unless @item.save
      p @item.errors
    end
    respond_to do |format|
      format.js
    end
  end

  def new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def item_params
    params.require(:item).permit(:category, :volume, :volume_type, :price, :quantity)
  end
end