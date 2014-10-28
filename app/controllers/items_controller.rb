class ItemsController < ApplicationController
  def create
    @item = Item.new(params[:item])
    respond_to do |format|
      format.js
    end
  end

  def new
  end
end