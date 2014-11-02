class OptionsController < ApplicationController
  def new
    @option = Option.create
  end
end