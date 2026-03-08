require 'rails_helper'

RSpec.describe Project, type: :model do

  describe "associations" do
    it { should have_many(:documents).dependent(:destroy) }
    it { should have_many(:bg_images).dependent(:destroy) }
    it { should have_many(:project_software_skills).dependent(:destroy) }
    it { should have_many(:software_skills).through(:project_software_skills) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end