require 'spec_helper'
require 'simple_admin/helpers/boolean_helper'

RSpec.describe SimpleAdmin::Helpers::BooleanHelper do
  let(:dummy_klass_instance) { Examples.new }

  before do
    class Examples
      include ActiveModel::Model
      include SimpleAdmin::Helpers::BooleanHelper

      attr_accessor :enabled

      boolean_fields :enabled
    end
  end

  specify do
    dummy_klass_instance.enabled = true

    expect(dummy_klass_instance.enabled_humanized).to eq 'Yes'
    expect(dummy_klass_instance.enabled?).to eq true

    dummy_klass_instance.enabled = false
    expect(dummy_klass_instance.enabled_humanized).to eq 'No'
    expect(dummy_klass_instance.enabled?).to eq false
  end
end
