require 'rails_helper'

describe UsersController, :type => :controller do

    before do
      # @user = User.create!(email: 'test3@example.com', password: '1234567890')
      @user = FactoryGirl.create(:user)
      # @user2 = User.create!(email: 'test4@example.com', password: '1234567890')
      @user2 = FactoryGirl.create(:user)
      sign_in @user
    end
    describe "GET #show" do
      context 'User is logged in' do
        it 'loads correct user details' do
          get :show, params: {id: @user.id}
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user
        end
      end
     end
      context 'No user is logged in' do
        it 'redirects to login' do
          get :show, params: {id: @user.id}
          expect(response).to be_successful
          redirect_to(root_path)
        end
      end
      context 'User not authorized' do
        it 'redirects to root path' do
          get :show, params: {id: @user2.id}
          expect(response).to be_successful
          expect(assigns(:user)).not_to eq(@user2)
          redirect_to root_url
        end
      end

end
