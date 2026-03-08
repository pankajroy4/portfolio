require 'rails_helper'

RSpec.describe SiteConfiguration, type: :model do

  describe "associations" do
    it { should belong_to(:theme).optional }
  end

  describe "callbacks" do
    it "deactivates other active configurations" do
      create(:site_configuration, :active)

      new_config = create(:site_configuration, :active)

      expect(SiteConfiguration.active.count).to eq(1)
      expect(new_config).to be_active
    end
  end
end