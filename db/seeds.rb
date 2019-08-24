# frozen_string_literal: true

SimpleAdmin::EntityFieldType.create(name: 'number',  template: 'admin/fields/number')
SimpleAdmin::EntityFieldType.create(name: 'price',   template: 'admin/fields/price')
SimpleAdmin::EntityFieldType.create(name: 'string',  template: 'admin/fields/string')
SimpleAdmin::EntityFieldType.create(name: 'text',    template: 'admin/fields/text')
SimpleAdmin::EntityFieldType.create(name: 'date',    template: 'admin/fields/date')
SimpleAdmin::EntityFieldType.create(name: 'boolean', template: 'admin/fields/boolean')
SimpleAdmin::EntityFieldType.create(name: 'url',     template: 'admin/fields/url')
SimpleAdmin::EntityFieldType.create(name: 'image',   template: 'admin/fields/image')
SimpleAdmin::EntityFieldType.create(name: 'wysiwyg', template: 'admin/fields/wysiwyg')

SimpleAdmin::WidgetCategory.create(name: :total_qnt, label: 'Quantity', template: 'admin/widgets/total_qnt')
SimpleAdmin::WidgetCategory.create(name: :week_statistic, label: 'Week Statistic',
                                   template: 'admin/widgets/week_statistic')

User.create(email: 'demo@example.com', password: :example, password_confirmation: :example)
