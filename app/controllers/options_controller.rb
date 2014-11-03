class OptionsController < ApplicationController
  def create
    @option = Option.create
    session[:options] << @option.id
  end

  def destroy
    @option = Option.find(params[:id])
    session[:options].delete(@option.id)
    @option.destroy
  end
end