require 'rails_helper'
describe User do
	context "when creating user" do
		it "user cannot be created without an email" do
			@user = User.new(password: "123456")
			expect(@user).not_to be_valid
		end

		it "created with a not valid formated email" do
			@user = User.new(email: "thisisnotavalidemail", password: "123456")
			expect(@user).to_not be_valid	
		end

		it "password not supplied" do
			@user = User.new(email: "test@test.com")
			expect(@user).to_not be_valid
		end

		it "all information is valid" do
			expect(User.new(email: "test@test.com", password: "123456")).to be_valid
		end
	end
end