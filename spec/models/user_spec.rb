require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class }

  it "is valid with not valid attributes" do
    expect(subject.new).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(subject.new(email: 'test@mail.test', password: '1234qwer')).to be_valid
  end
end
