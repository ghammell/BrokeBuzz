class ItemsController < ApplicationController
  def create
    @option = Option.find(params[:option_id])
    @item = @option.items.new(item_params)
    unless @item.save
      p @item.errors
    end
    @options = session[:options].map { |option_id| Option.find(option_id) }
    @option_winner = @options.min_by {|option| option.price_per_oz}
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
    params.require(:item).permit(:category, :volume, :volume_type, :price, :quantity, :abv)
  end
end