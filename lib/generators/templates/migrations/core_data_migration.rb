class CreateSimpleAdminCoreDataMigration < ActiveRecord::Migration[5.0]
  def change
    SimpleAdmin::EntityFieldType.create(name: :boolean, template: 'simple_admin/fields/boolean')
    SimpleAdmin::EntityFieldType.create(name: :number,  template: 'simple_admin/fields/number')
    SimpleAdmin::EntityFieldType.create(name: :select,  template: 'simple_admin/fields/select')
    SimpleAdmin::EntityFieldType.create(name: :string,  template: 'simple_admin/fields/string')
    SimpleAdmin::EntityFieldType.create(name: :text,    template: 'simple_admin/fields/text')
    SimpleAdmin::EntityFieldType.create(name: :image,   template: 'simple_admin/fields/image')
    SimpleAdmin::EntityFieldType.create(name: :tags,    template: 'simple_admin/fields/tags')
    SimpleAdmin::EntityFieldType.create(name: :relation, template: 'simple_admin/fields/relation')

    admin_user  = SimpleAdmin::User.create(email: 'admin@example.com', password: 'example')
    editor_user = SimpleAdmin::User.create(email: 'editor@example.com', password: 'example')

    admin_user.add_role(:admin)
    editor_user.add_role(:editor)

    SimpleAdmin::Setting.create(label: 'Site address', name: :site_url, value: 'http://localhost:3000/')

    admin_role = SimpleAdmin::Role.find_by(name: :admin)
    editor_role = SimpleAdmin::Role.find_by(name: :editor)

    SimpleAdmin::UserPermission.create(action: :can, action_modificator: :manage, model_klass_name: :all, role: admin_role)

    SimpleAdmin::UserPermission.create(action: :can, action_modificator: :manage, model_klass_name: :all, role: editor_role)
    SimpleAdmin::UserPermission.create(action: :cannot, action_modificator: :manage,
                                       model_klass_name: SimpleAdmin::Entity.to_s, role: editor_role)
    SimpleAdmin::UserPermission.create(action: :cannot, action_modificator: :manage,
                                       model_klass_name: SimpleAdmin::EntityFieldType.to_s, role: editor_role)
  end
end
