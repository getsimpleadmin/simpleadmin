module Migrations
  def change
    reversible do |dir|
      dir.up do
        SimpleAdmin::Post.create_translation_table! title: :string, description: :string
        SimpleAdmin::Category.create_translation_table! title: :string
        SimpleAdmin::EntityField.create_translation_table! label: :string

        SimpleAdmin::Widget.create_translation_table! label: :string
        SimpleAdmin::Setting.create_translation_table! label: :string
      end

      dir.down do
        SimpleAdmin::Post.drop_translation_table!
        SimpleAdmin::Category.drop_translation_table!
        SimpleAdmin::EntityField.drop_translation_table!

        SimpleAdmin::Widget.drop_translation_table!
        SimpleAdmin::Setting.drop_translation_table!
      end
    end
  end
end

CreateSimpleAdminTranslationMigrations = if Rails::VERSION::STRING.to_i < 5
                                           Class.new(ActiveRecord::Migration) do
                                             include Migrations
                                           end
                                         else
                                           Class.new(ActiveRecord::Migration[5.1]) do
                                             include Migrations
                                           end
                                         end
