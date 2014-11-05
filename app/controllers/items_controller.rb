class ItemsController < ApplicationController
  def create
    @option = Option.find(params[:option_id])
    @item = @option.items.new(item_params)
    unless @item.save
      p @item.errors
    end
    determine_option_winner
  end

  def new
  end

  def destroy
    @item = Item.find(params[:id])
    @option = @item.option
    @item.destroy
    determine_option_winner
  end

  private
  def item_params
    params.require(:item).permit(:name, :category, :volume, :volume_type, :price, :quantity, :abv)
  end

  def determine_option_winner
    @options = session[:options].map { |option_id| Option.find(option_id) }
    @option_winner = @options.min_by {|option| option.price_per_oz}
  end
end