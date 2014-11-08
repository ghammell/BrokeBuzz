require 'spec_helper'
require 'rails_helper'

describe ItemsController do
  before(:each) do
    Item.delete_all
    Option.delete_all
    session[:options] = []
  end

  create_params = {:name => 'item', :category => 'beer', :volume => 12, :volume_type => 'oz', :price => 15, :quantity => 12, :abv => 5}
  losing_params = {:name => 'item', :category => 'beer', :volume => 12, :volume_type => 'oz', :price => 30, :quantity => 12, :abv => 5}


  describe 'POST #create' do
    it 'successfully creates a new item' do
      option = Option.create
      item_count = Item.count
      post :create, {:option_id => option.id, :item => create_params, :format => 'js'}

      expect(Item.count).to eq(item_count + 1)
    end

    it 'determines the correct option winner' do
      winning_option = Option.create
      losing_option = Option.create
      session[:options] = [winning_option.id, losing_option.id]

      post :create, {:option_id => winning_option.id, :item => create_params, :format => 'js'}
      post :create, {:option_id => losing_option.id, :item => losing_params, :format => 'js'}

      expect(assigns(:option_winner).id).to eq(winning_option.id)
    end

    it 'maps the new item to the correct option' do
      option = Option.create
      option_item_count = option.items.count
      post :create, {:option_id => option.id, :item => create_params, :format => 'js'}

      expect(option.items.count).to eq(option_item_count + 1)
    end
  end

  describe 'DELETE #destroy' do
    it 'successfully deletes a given item' do

    end

    it 'determines the correct option winner' do

    end

    it 'removes the given item from the correct option' do

    end
  end

end