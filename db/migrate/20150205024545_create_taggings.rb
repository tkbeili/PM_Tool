class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :project, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :taggings, :projects
    add_foreign_key :taggings, :tags
  end
end
