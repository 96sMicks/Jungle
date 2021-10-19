require 'rails_helper'
require 'User'

RSpec.describe User, type: :model do
  describe 'User Validations' do

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

    it 'should not validate a User with a password too short' do
      @user = User.create({name: "Johnny Flynn", email: "JFlynn@gmail.com", password: "aswq", password_confirmation: "aswq" })
      @user.valid?

      expect(@user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    it 'should not validate a User with no name' do
      @user = User.create({name: "", email: "John@gmail.com", password: "password", password_confirmation: "password" })
      @user.valid?

      expect(@user.errors[:name]).to include("can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should valid a known user in the db' do
      @user = User.create!({name: "Johnny Flynn", email: "JFlynn@gmail.com", password: "password", password_confirmation: "password" })
      @user.save!
      
      expect
  end
end
