class OptionsController < ApplicationController
  def new
    @option = Option.create
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy
  end
end