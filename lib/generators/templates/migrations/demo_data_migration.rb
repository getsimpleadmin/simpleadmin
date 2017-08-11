module Migrations
  def change
    Rails::Generators.invoke('simple_admin:routes')
    Rails::Generators.invoke('simple_admin:models')

    post_entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Post, model_plural_name: :posts)
    category_entity = SimpleAdmin::Entity.create(model_klass_name: SimpleAdmin::Category, model_plural_name: :categories)

    field_boolean_type = SimpleAdmin::EntityFieldType.create(name: :boolean, template: 'simple_admin/fields/boolean')
    field_number_type  = SimpleAdmin::EntityFieldType.create(name: :number, template: 'simple_admin/fields/number')
    field_select_type  = SimpleAdmin::EntityFieldType.create(name: :select, template: 'simple_admin/fields/select')
    field_string_type  = SimpleAdmin::EntityFieldType.create(name: :string, template: 'simple_admin/fields/string')
    field_text_type    = SimpleAdmin::EntityFieldType.create(name: :text,  template: 'simple_admin/fields/text')
    field_image_type   = SimpleAdmin::EntityFieldType.create(name: :image, template: 'simple_admin/fields/image')

    field_select_enum_type = SimpleAdmin::EntityFieldType.create(name: :select_enum, template: 'simple_admin/fields/select_enum')

    SimpleAdmin::EntityField.create(name: :id, label: :id, entity_field_type_id: field_number_type.id, entity_id: post_entity.id, display: :index)
    SimpleAdmin::EntityField.create(name: :title, label: 'Заголовок', entity_field_type_id: field_string_type.id, entity_id: post_entity.id, display: :index)
    SimpleAdmin::EntityField.create(name: :description, label: 'Описание', entity_field_type_id: field_text_type.id, entity_id: post_entity.id, display: :index)
    SimpleAdmin::EntityField.create(name: :image, label: 'Изображение', entity_field_type_id: field_image_type.id, entity_id: post_entity.id, display: :index)

    SimpleAdmin::EntityField.create(name: :title, label: 'Заголовок', entity_field_type_id: field_string_type.id, entity_id: post_entity.id, display: :form)
    SimpleAdmin::EntityField.create(name: :description, label: 'Описание', entity_field_type_id: field_text_type.id, entity_id: post_entity.id, display: :form)
    SimpleAdmin::EntityField.create(name: :image, label: 'Изображение', entity_field_type_id: field_image_type.id, entity_id: post_entity.id, display: :form)
    post_select_field = SimpleAdmin::EntityField.create(name: :category_id, label: 'Категория', entity_field_type_id: field_select_type.id, entity_id: post_entity.id, display: :form)

    SimpleAdmin::EntityFieldSetting.create(entity_field_id: post_select_field.id, data: [{name: :select_collection, label: "Field Collection", value: "SimpleAdmin::Category.all.with_translations(params[:locale]).pluck(:title, :id)"}])

    SimpleAdmin::EntityField.create(name: :id, label: :id, entity_field_type_id: field_number_type.id, entity_id: category_entity.id, display: :index)
    SimpleAdmin::EntityField.create(name: :title, label: 'Заголовок', entity_field_type_id: field_string_type.id, entity_id: category_entity.id, display: :index)

    SimpleAdmin::EntityField.create(name: :title, label: 'Заголовок', entity_field_type_id: field_string_type.id, entity_id: category_entity.id, display: :form)

    SimpleAdmin::Language.create(name: 'English', code: :en, status: true)
    SimpleAdmin::Language.create(name: 'Русский', code: :ru, status: true)

    SimpleAdmin::User.create(email: 'demo@example.com', password: 'password')

    featured_widget = SimpleAdmin::WidgetType.create(name: :featured)

    SimpleAdmin::Widget.create_with_translation({
                                                  ru: { label: 'Рекомендуемые' },
                                                  en: { label: 'Featured' }
                                                }, name: :featured, widget_type_id: featured_widget.id)

    SimpleAdmin::Setting.create_with_translation({
                                                   ru: { label: 'Язык по умолчанию' },
                                                   en: { label: 'Admin panel language' }
                                                 }, name: :default_language, value: :ru, presentation: 'simple_admin/fields/settings/select_form', sort_order: 1)

    SimpleAdmin::Setting.create_with_translation({
                                                   ru: { label: 'Адрес сайта' },
                                                   en: { label: 'Website address' }
                                                 }, name: :site_url, value: 'http://localhost:3000/', presentation: 'simple_admin/fields/settings/string_form', sort_order: 2)

    puts 'Demo user: '
    puts 'email: demo@example.com'
    puts 'password: password'
  end
end

CreateSimpleAdminDemoDataMigrations = if Rails::VERSION::STRING.to_i < 5
                                        Class.new(ActiveRecord::Migration) do
                                          include Migrations
                                        end
                                      else
                                        Class.new(ActiveRecord::Migration[5.1]) do
                                          include Migrations
                                        end
                                      end
