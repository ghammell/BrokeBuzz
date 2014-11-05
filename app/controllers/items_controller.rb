require 'net/http'

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

  def name_search
    search_term = params[:search_term]
    beer_key = '283db9c15918747640eb81252e2aa424'
    url = URI.parse('http://api.brewerydb.com/v2/beers?name=' + search_term + '&key=' + beer_key )
    req = Net::HTTP::Get.new(url.to_s)
    result = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    p JSON.parse(result.body)['data']
    render nothing: true
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