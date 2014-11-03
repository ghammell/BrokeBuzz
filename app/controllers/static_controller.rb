class StaticController < ApplicationController
  def home
    session[:options] = []
  end
end
