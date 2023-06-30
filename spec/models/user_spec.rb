require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'luis', email: 'example@email.com', password: 'password') }

  context 'validations' do
    it('should be valid') do
      expect(user).to be_valid
    end

    it('should not be valid without a name') do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
