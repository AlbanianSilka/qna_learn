require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :comment }
  it { should belong_to :post }


end