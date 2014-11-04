class OptionsController < ApplicationController
  def create
    @option = Option.create
    session[:options] << @option.id
    determine_option_winner
  end

  def destroy
    determine_option_winner
    @option = Option.find(params[:id])
    session[:options].delete(@option.id)
    @option.destroy
  end

  private
  def determine_option_winner
    @options = session[:options].map { |option_id| Option.find(option_id) }
    @option_winner = @options.min_by {|option| option.price_per_oz}
  end
end