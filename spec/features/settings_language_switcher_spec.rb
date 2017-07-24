require 'spec_helper'

RSpec.describe 'Default language switcher in settings', type: :feature, js: true do
  let!(:language_en) { create :language, code: :en }
  let!(:language_ru) { create :language, code: :ru }

  let!(:setting_language) { SimpleAdmin::Setting.find_or_create_by(name: :default_language, label: 'Язык по умолчанию',
                                                                value: :ru, presentation: 'fields/settings/select_form') }
  let!(:setting_staging_url) { SimpleAdmin::Setting.find_or_create_by(name: :site_url_staging, label: 'Адрес сайта (staging)',
                                    value: 'http://staging.warrobots.net/', presentation: 'fields/settings/string_form') }
  let!(:setting_production_url) { SimpleAdmin::Setting.find_or_create_by(name: :site_url_production, label: 'Адрес сайта (production)',
                                        value: 'http://faq.wwr.mobi/hc/ru', presentation: 'fields/settings/string_form') }

  subject { visit admin_system_settings_path(locale: SimpleAdmin::Setting.default_language) }

  it 'change language in admin panel' do
    subject

    click_sub_menu_link('СИСТЕМА')

    expect(page).to have_link 'Настройки'
    expect(page).to have_link 'Языки'
    expect(page).to have_link 'Модели'
    expect(page).to have_link 'Типы полей'

    select 'en', from: 'simple_admin_setting[value]'

    click_button 'Обновить', match: :first

    click_sub_menu_link('SYSTEM')

    expect(page).to have_link 'Settings'
    expect(page).to have_link 'Languages'
    expect(page).to have_link 'Models'
    expect(page).to have_link 'Field Types'
  end
end
