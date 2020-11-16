# frozen_string_literal: true

class CreateShortUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.string :full_url, index: true, null: false
      t.string :title
      t.integer :click_count, default: 0, null: false

      t.timestamps
    end
  end
end
