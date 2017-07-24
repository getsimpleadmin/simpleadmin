require 'spec_helper'

RSpec.describe 'Default language switcher in settings', type: :feature, js: true do
  let!(:language_en) { create :language, code: :en }
  let!(:language_ru) { create :language, code: :ru }

  let!(:setting) { SimpleAdmin::Setting.find_or_create_by(name: :default_language, value: :ru) }

  subject { visit admin_system_settings_path(locale: SimpleAdmin::Setting.default_language) }

  it 'change language in admin panel' do
    subject

    click_sub_menu_link('СИСТЕМА')

    expect(page).to have_link 'Настройки'
    expect(page).to have_link 'Языки'
    expect(page).to have_link 'Модели'
    expect(page).to have_link 'Типы полей'

    select 'en', from: 'simple_admin_setting[value]'

    click_button 'Сохранить'

    click_sub_menu_link('SYSTEM')

    expect(page).to have_link 'Settings'
    expect(page).to have_link 'Languages'
    expect(page).to have_link 'Models'
    expect(page).to have_link 'Field Types'
  end
end
