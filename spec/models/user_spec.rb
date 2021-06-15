require 'spec_helper'

RSpec.describe User, type: :model do
    it 'ensures email presence' do
      expect(User.new(email: 'example@test.com')).to_not be_valid
    end
  end

  context 'scope test' do
  end

