# frozen_string_literal: true

FriendlyId.defaults do |config|
  config.use :reserved

  config.reserved_words = %w[new edit index session logout
                             stylesheets assets javascripts images]
end
