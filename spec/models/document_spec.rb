require 'rails_helper'

RSpec.describe Document, type: :model do

  describe "associations" do
    it { should belong_to(:project).optional }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:file) }
    it { should validate_presence_of(:document_type) }
  end

  describe "callbacks" do
    it "deactivates other active resumes" do
      create(:document, :resume)

      new_resume = create(:document, :resume)

      expect(Document.resume.active.count).to eq(1)
      expect(new_resume.reload.status).to eq("active")
    end
  end
end