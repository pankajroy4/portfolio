class CreateSiteConfigurations < ActiveRecord::Migration[7.1]
  def change
    create_table :site_configurations, id: :uuid do |t|
      t.string :logo_name
      t.boolean :splash, default: true
      t.string :status, default: "active"
      t.jsonb :seo, default: { og: { url: "http://pankajkumar.info/", type: "website", title: "Pankaj Kumar Portfolio" }, title: "Pankaj's Portfolio", description: "An enthusiastic problem-solver passionate about developing end-to-end products that drive innovation, sustainability, and long-term scalability, creating impactful solutions that bridge technology and society."}
      t.jsonb :menu_items, default: [{ "to": "/home", "label": "Home"}, { "to": "/education", "label": "Education" }, { "to": "/experience", "label": "Experience" }, { "to": "/projects",
      "label": "Projects"}, { "to": "/repoactivity", "label": "Repo Activity" }, { "to": "/contact", "label": "Contact Me" }]

      t.json :address, default: {locality: "Sudama Nagar", region: "Indore", country: "India", postal_code: "452009", street_address: "Gopur Square", job_title: "Software developer", company_name: "Gemsessence Info Tech pvt ltd."}

      t.references :theme, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
