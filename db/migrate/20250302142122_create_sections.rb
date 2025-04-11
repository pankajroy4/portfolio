class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections, id: :uuid do |t|
      t.string :section_name
      t.string :section_image
      t.text :section_svg_data
      t.string :title
      t.string :subtitle
      t.jsonb :button, default: { to: "https://www.github.com", label: "More Projects", map_embed_src: "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1" }
      t.string :description, default: "An enthusiastic problem-solver passionate about developing end-to-end products that drive innovation, sustainability, and long-term scalability, creating impactful solutions that bridge technology and society."
      t.jsonb :others, default: { email: "abc@gmail.com", phone: "+91 1234567890", typewriter: ["Full Stack Developer", "Syntax & Stories", "Compiling Dreams"], wave_emoji: "👋", cursor_style: "🔥", }

      t.timestamps
    end
    add_index :sections, :section_name, unique: true
  end
end
