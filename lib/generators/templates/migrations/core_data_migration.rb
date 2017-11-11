class CreateSimpleAdminCoreDataMigration < ActiveRecord::Migration[5.0]
  def change
    require 'factory_bot'

    FactoryBot.create(:entity_field_type, name: :boolean,  template: 'simple_admin/fields/boolean')
    FactoryBot.create(:entity_field_type, name: :number,   template: 'simple_admin/fields/number')
    FactoryBot.create(:entity_field_type, name: :select,   template: 'simple_admin/fields/select')
    FactoryBot.create(:entity_field_type, name: :string,   template: 'simple_admin/fields/string')
    FactoryBot.create(:entity_field_type, name: :text,     template: 'simple_admin/fields/text')
    FactoryBot.create(:entity_field_type, name: :image,    template: 'simple_admin/fields/image')
    FactoryBot.create(:entity_field_type, name: :tags,     template: 'simple_admin/fields/tags')
    FactoryBot.create(:entity_field_type, name: :relation, template: 'simple_admin/fields/relation')

    admin  = FactoryBot.create(:user, email: 'admin@example.com',  password: :example)
    editor = FactoryBot.create(:user, email: 'editor@example.com', password: :example)

    admin.add_role(:admin)
    editor.add_role(:editor)

    admin_role  = SimpleAdmin::Role.find_by(name: :admin)
    editor_role = SimpleAdmin::Role.find_by(name: :editor)

    FactoryBot.create(:user_permission, action: :can, action_modificator: :manage, model_klass_name: :all, role: admin_role)
    FactoryBot.create(:user_permission, action: :can, action_modificator: :manage, model_klass_name: :all, role: editor_role)
    FactoryBot.create(:user_permission, action: :cannot, action_modificator: :manage, model_klass_name: SimpleAdmin::Entity.to_s, role: editor_role)
    FactoryBot.create(:user_permission, action: :cannot, action_modificator: :manage,  model_klass_name: impleAdmin::EntityFieldType.to_s, role: editor_role)

    # @NOTE System entities
    user_entity = FactoryBot.create(model_klass_name: SimpleAdmin::User.to_s, inbuilt: true)

    SimpleAdmin::EntityField.create_string_field(name: :email,      entity: user_entity, presentation: :collection)
    SimpleAdmin::EntityField.create_string_field(name: :first_name, entity: user_entity, presentation: :collection)
    SimpleAdmin::EntityField.create_string_field(name: :last_name,  entity: user_entity, presentation: :collection)

    SimpleAdmin::EntityField.create_string_field(name: :email,      entity: user_entity, presentation: :form)
    SimpleAdmin::EntityField.create_string_field(name: :first_name, entity: user_entity, presentation: :form)
    SimpleAdmin::EntityField.create_string_field(name: :last_name,  entity: user_entity, presentation: :form)

    SimpleAdmin::EntityField.create_password_field(name: :password, entity: user_entity, presentation: :form)
    SimpleAdmin::EntityField.create_password_field(name: :password_confirmation, entity: user_entity, presentation: :form)
  end
end
