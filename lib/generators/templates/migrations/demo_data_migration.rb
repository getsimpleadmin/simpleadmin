module Migrations
  def change
    SimpleAdmin::Language.create(name: 'English', code: :en, status: true)
    SimpleAdmin::Language.create(name: 'Русский', code: :ru, status: true)
    
    SimpleAdmin::Setting.create(name: :default_language, label: 'Язык по умолчанию', value: :en, presentation: 'simple_admin/fields/settings/select_form', sort_order: 1)
    SimpleAdmin::Setting.create(name: :site_url_staging, label: 'Адрес сайта (staging)', value: 'http://staging.warrobots.net/', presentation: 'simple_admin/fields/settings/string_form', sort_order: 2)
    SimpleAdmin::Setting.create(name: :site_url_production, label: 'Адрес сайта (production)', value: 'http://faq.wwr.mobi/hc/ru', presentation: 'simple_admin/fields/settings/string_form', sort_order: 3)

    SimpleAdmin::User.create(email: "demo@example.com", password: "password")

    puts "Demo user: "
    puts "email: demo@example.com"
    puts "password: password"
  end
end

if Rails::VERSION::STRING.to_i < 5
  CreateSimpleAdminDemoDataMigrations = Class.new(ActiveRecord::Migration) do
    include Migrations
  end
else
  CreateSimpleAdminDemoDataMigrations = Class.new(ActiveRecord::Migration[5.1]) do
    include Migrations
  end
end
