require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
  end

  describe "enums" do
    # it { should define_enum_for(:role).with_values(admin: "admin", viewer: "viewer") }
    it do
      should define_enum_for(:role)
        .with_values(admin: "admin", viewer: "viewer")
        .backed_by_column_of_type(:string)
    end
  end

  describe "callbacks" do
    it "sets uid before validation" do
      user = build(:user, uid: nil)
      user.valid?
      expect(user.uid).to eq(user.email)
    end
  end
end