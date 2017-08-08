require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it 'this should pass' do
      @user = User.new({
        first_name: 'Billy',
        last_name: 'Tables',
        email: 'pinkfloydrulez29@hotmail.com',
        password: 'kittens'
        })
      expect(@user).to be_present
    end

    it 'should have a first name' do
      @user = User.new({
        first_name: nil,
        last_name: 'Tables',
        email: 'pinkfloydrulez29@hotmail.com',
        password: 'kittens'
        })
      expect(@user.first_name).to be_falsy
    end

    it 'should have a last name' do
      @user = User.new({
        first_name: 'Billy',
        last_name: nil,
        email: 'pinkfloydrulez29@hotmail.com',
        password: 'kittens'
        })
      expect(@user.last_name).to be_falsy
    end

    it 'should have a password' do
      @user = User.new({
        first_name: 'Billy',
        last_name: 'Tables',
        email: 'pinkfloydrulez29@hotmail.com',
        password: nil
        })
      expect(@user.password).to be_falsy
    end

    it 'should have password length: minimum 4' do
      @user = User.create({
        first_name: 'Billy',
        last_name: 'Tables',
        email: 'pinkfloydrulez29@hotmail.com',
        password: 'hat'
        })
      expect(@user.save).to be_falsy
    end

    it 'should have a unique email' do
      @user1 = User.create({
        first_name: 'Billy',
        last_name: 'Tables',
        email: 'pinkfloydrulez29@hotmail.com',
        password: 'kittens'
        })
      @user2 = User.create({
        first_name: 'Joe',
        last_name: 'Schmoe',
        email: 'pinkfloydrulez29@hotmail.com',
        password: 'kittens'
        })
      expect(@user2.save).to be_falsy
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns false if a user is not authenticated' do
      @user1 = User.create({
        first_name: 'Billy',
        last_name: 'Tables',
        email: 'pinkfloydrulez29@hotmail.com',
        password: 'kittens'
        })
      expect(User.authenticate_with_credentials('does@not.exist', 'securepwd')).to be_falsy
    end
  end
end
