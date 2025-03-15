class EnableUuidExtension < ActiveRecord::Migration[7.1]
  def change
    enable_extension "pgcrypto" # Enable UUID generation in PostgreSQL
  end
end
