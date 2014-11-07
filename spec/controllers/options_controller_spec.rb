require 'spec_helper'
require 'rails_helper'

describe OptionsController do
  describe 'POST #create' do
    it 'successfully creates a new option' do
      option_count = Option.count
      session[:options] = []
      post :create, {:format => 'js'}

      expect(Option.count).to eq(option_count + 1)
    end
  end

  describe 'DELETE #destroy' do
    it 'successfully deletes a given option' do
      assert_raises(ActiveRecord::RecordNotFound) do
        option_id = Option.create.id
        session[:options] = [option_id]
        delete :destroy, {:id => option_id, :format => 'js'}

        Option.find(option_id)
      end
    end
  end
end