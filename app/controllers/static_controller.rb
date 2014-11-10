class StaticController < ApplicationController
  def index
    render :text => "whatever"
  end

  def home
    session[:options] = []
  end
end
