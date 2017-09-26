class CreateSimpleAdminCoreDataMigration < ActiveRecord::Migration[5.1]
  def change
    # FIELD TYPES #
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

    category = SimpleAdmin::Category.create(title: 'Popular')
    SimpleAdmin::Post.create(title: 'Hello world!', description: "It's post example", user: admin_user, category: category)

    post_entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Post.to_s, label: 'Posts', status: true, inbuilt: true)

    SimpleAdmin::EntityField.create_string_field(name: :title, entity: post_entity, sort_order: 1, presentation: :collection, search_indexable: true)
    SimpleAdmin::EntityField.create_string_field(name: :description, entity: post_entity, sort_order: 2, presentation: :collection, search_indexable: true)
    SimpleAdmin::EntityField.create_image_field(name:  :image, entity: post_entity, sort_order: 3, presentation: :collection)
    SimpleAdmin::EntityField.create_tags_field(name:   :tags, entity: post_entity, sort_order: 4, presentation: :collection)
    post_relation_collection_field = SimpleAdmin::EntityField.create_relation_field(name: :category_id, label: 'Category', entity: post_entity, sort_order: 5, presentation: :collection)
    SimpleAdmin::EntityFieldSetting.create(name: :relation_attribute, value: :title, entity_field: post_relation_collection_field)

    SimpleAdmin::EntityField.create_string_field(name: :title, entity: post_entity, sort_order: 1, presentation: :form)
    SimpleAdmin::EntityField.create_string_field(name: :description, entity: post_entity, sort_order: 2, presentation: :form)
    SimpleAdmin::EntityField.create_image_field(name: :image, entity: post_entity, sort_order: 3, presentation: :form)
    SimpleAdmin::EntityField.create_tags_field(name: :tags, entity: post_entity, sort_order: 4, presentation: :form)
    post_relation_form_field = SimpleAdmin::EntityField.create_relation_field(name: :category_id, label: 'Category', entity: post_entity, sort_order: 5, presentation: :form)
    SimpleAdmin::EntityFieldSetting.create(name: :relation_attribute, value: :title, entity_field: post_relation_form_field)

    comment_entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Comment.to_s, label: 'Comments', status: true, inbuilt: true)

    SimpleAdmin::EntityField.create_string_field(name: :message, entity: comment_entity, sort_order: 1, presentation: :collection)
    comment_user_relation_collection_field = SimpleAdmin::EntityField.create_relation_field(name: :user_id, label: 'User', entity: comment_entity, sort_order: 2, presentation: :collection)
    SimpleAdmin::EntityFieldSetting.create(name: :relation_attribute, value: :email, entity_field: comment_user_relation_collection_field)
    comment_post_relation_collection_field = SimpleAdmin::EntityField.create_relation_field(name: :post_id, label: 'Post', entity: comment_entity, sort_order: 3, presentation: :collection)
    SimpleAdmin::EntityFieldSetting.create(name: :relation_attribute, value: :title, entity_field: comment_post_relation_collection_field)

    SimpleAdmin::EntityField.create_string_field(name: :message, entity: comment_entity, sort_order: 1, presentation: :form)
    comment_user_relation_form_field = SimpleAdmin::EntityField.create_relation_field(name: :user_id, label: 'User', entity: comment_entity, sort_order: 2, presentation: :form)
    SimpleAdmin::EntityFieldSetting.create(name: :relation_attribute, value: :email, entity_field: comment_user_relation_form_field)
    comment_post_relation_form_field = SimpleAdmin::EntityField.create_relation_field(name: :post_id, label: 'Post', entity: comment_entity, sort_order: 3, presentation: :form)
    SimpleAdmin::EntityFieldSetting.create(name: :relation_attribute, value: :title, entity_field: comment_post_relation_form_field)

    category_entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Category.to_s, label: 'Categories', status: true, inbuilt: true)

    SimpleAdmin::EntityField.create_string_field(name: :title, entity: category_entity, sort_order: 1, presentation: :collection)
    SimpleAdmin::EntityField.create_string_field(name: :title, entity: category_entity, sort_order: 2, presentation: :form)

    featured_widget = SimpleAdmin::PluginType.create(name: :featured)

    SimpleAdmin::Setting.create(label: 'Site address', name: :site_url, value: 'http://localhost:3000/')

    puts 'Admin user: '
    puts 'email: admin@example.com'
    puts 'password: password'
  end
end
