require 'rails_helper'
require 'User'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should save a valid User' do
      @user = User.create!({name: "Johnny Flynn", email: "JFlynn@gmail.com", password: "password", password_confirmation: "password" })
      @user.save!

      expect(@user.id).to be_present
    end

    it 'should not validate a User with the wrong passwords' do
      @user = User.create({name: "Johnny Flynn", email: "JFlynn@gmail.com", password: "pass", password_confirmation: "password" })
      @user.valid?

      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'should not validate a User with no passwords' do
      @user = User.create({name: "Johnny Flynn", email: "JFlynn@gmail.com", password: nil, password_confirmation: nil })
      @user.valid?

      expect(@user.errors[:password]).to include("can't be blank")
    end


  end
end
