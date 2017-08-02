class CreateSimpleAdminTranslationMigrations < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        SimpleAdmin::Post.create_translation_table! title: :string, description: :string
        SimpleAdmin::Category.create_translation_table! title: :string
        SimpleAdmin::EntityField.create_translation_table! label: :string
      end

      dir.down do
        SimpleAdmin::Post.drop_translation_table!
        SimpleAdmin::Category.drop_translation_table!
        SimpleAdmin::EntityField.drop_translation_table!
      end
    end
  end
end
