require 'rails_helper'

RSpec.describe Skill, type: :model do

  describe "associations" do
    it { should have_many(:software_skills) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:filename) }
  end
end