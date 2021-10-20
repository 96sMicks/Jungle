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

    it 'return user when authenticate successful' do
      @user = User.create(name: 'Johnny Flynn', email: 'jflynn@gmail.com', password: 'password', password_confirmation: 'password')
      @user2 = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user2).to_not be_nil
    end

    it 'return nil if fail to authenticate' do
      @user = User.create(name: 'Johnny Flynn', email: 'jflynn@gmail.com', password: '12345678', password_confirmation: '12345678')
      @user2 = User.authenticate_with_credentials('1234@gmail.com', '12345678')
      expect(@user2).to be_nil
    end

    it 'email should be without whitespace' do
      @user = User.create(name: "Jrue Holiday", email: 'jholiday@gmail.com', password: 'password', password_confirmation: 'password')
      @user2 = User.authenticate_with_credentials(' jholiday@gmail.com ', @user.password)
      expect(@user).to eq(@user2)
    end

    it 'email should be lowercase' do
      @user = User.create(name: "Anthony Davis", email: 'ad@gmail.com', password: '123456789', password_confirmation: '123456789')
      @user2 = User.authenticate_with_credentials('ad@gMAiL.com', @user.password)
      expect(@user).to eq(@user2)
    end
  end

end
