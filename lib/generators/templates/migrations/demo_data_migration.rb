module Migrations
  def change
    Rails::Generators.invoke('simple_admin:routes')
    Rails::Generators.invoke('simple_admin:models')

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
