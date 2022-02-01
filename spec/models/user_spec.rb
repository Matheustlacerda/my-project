require 'spec_helper.rb'

describe User, type: :model do
  context 'user validation test' do
    it 'user name must exist' do
      user = User.new(name:'Jane', age:30)
      expect(user.valid?).to eq(true)
    end
  end
end
