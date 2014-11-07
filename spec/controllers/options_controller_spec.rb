require 'spec_helper'
require 'rails_helper'


describe OptionsController do
  before(:each) do
    Option.delete_all
    session[:options] = []
  end

  describe 'POST #create' do
    it 'successfully creates a new option' do
      option_count = Option.count
      post :create, {:format => 'js'}

      expect(Option.count).to eq(option_count + 1)
    end

    it 'determines the correct option winner' do
      loser = Option.create(:price_per_oz => 1)
      session[:options] << loser.id

      post :create, {:format => 'js'}
      expect(assigns(:option_winner).id).to eq(Option.last.id)
    end
  end

  describe 'DELETE #destroy' do
    it 'successfully deletes a given option' do
      assert_raises(ActiveRecord::RecordNotFound) do
        option_id = Option.create.id
        session[:options] << option_id
        delete :destroy, {:id => option_id, :format => 'js'}

        Option.find(option_id)
      end
    end

    it 'determines the correct option winner' do
      winner = Option.create(:price_per_oz => 1)
      loser = Option.create(:price_per_oz => 2)
      deleted = Option.create(:price_per_oz => 0)

      session[:options] = [winner.id, loser.id, deleted.id]

      delete :destroy, {:id => deleted.id, :format => 'js'}

      expect(assigns(:option_winner).id).to eq(winner.id)
    end
  end
end