require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do   
      @product = Product.create!(name: "Best bike", price: "3435") 
      @user = User.create!(email: "test@test.com", password: "123456")
      @product.comments.create!(rating: 1, user: @user, body: "Vamos!")
      @product.comments.create!(rating: 3, user: @user, body: "Vamos! Vamos!")
      @product.comments.create!(rating: 5, user: @user, body: "Vamos! Vamos! Vamos!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq (3)
    
    end

 
  end
end