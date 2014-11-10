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
    search_term = params[:search_term].gsub(" ", "+")
    if params[:type] == 'beer'
      beer_search(search_term)
    elsif params[:type] == 'wine'
      wine_search(search_term)
    else
      render nothing: true
    end
  end

  def beer_search(search_term)
    brew_db = ItemsHelper::BreweryDB.new
    beer_results = brew_db.beers_search(search_term) || []

    @results = beer_results.map do |beer_hash|
      { name: beer_hash['name'], abv: beer_hash['abv'] }
    end

    render :partial => 'search_results'
  end

  def wine_search(search_term)
    wine_db = ItemsHelper::WineDB.new
    wine_results = wine_db.wines_search(search_term) || []

    @results = wine_results.map do |wine_hash|
      { name: wine_hash['Name'], abv: wine_hash['abv'], price: wine_hash['PriceRetail'] }
    end

    render :partial => 'search_results'
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