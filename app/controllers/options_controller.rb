class OptionsController < ApplicationController
  def create
    @option = Option.create
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy
  end
end