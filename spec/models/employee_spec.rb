require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { described_class }

  it "is valid with not valid attributes" do
    expect(subject.new).to_not be_valid
  end

  it "is valid with valid attributes" do
    department = Department.create(name: 'Test department')
    expect(subject.new(name: 'Test', department: department)).to be_valid
  end
end
