# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_one :project, dependent: :destroy

  after_commit :process_project!, on: :create

  private

  def process_project!
    build_project(page_title: I18n.t('title')).save
  end
end
