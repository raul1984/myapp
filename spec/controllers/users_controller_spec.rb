require 'rails_helper'

describe UsersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user)}
  let(:diffrent_user) {FactoryGirl.create(:user)}

  describe 'GET #show' do
    context 'User is logged in' do 
      before do
        sign_in user
      end

      it "loads correct user details" do
        get :show, params: {id: user.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end
    end

    context 'No user is logged in' do
      it 'requires to login' do
        get :show, params: {id: user.id}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'User tries to GET #show from diffrent user' do
      before do
        sign_in diffrent_user
      end

      it 'is not allowed to view user #show' do
        get :show, params: {id: user.id}
        expect(response).to have_http_status(302)
      end
    end
  end
end
