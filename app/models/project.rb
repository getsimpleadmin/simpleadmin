# frozen_string_literal: true

require 'bcrypt'

class Project < ApplicationRecord
  enum style: %i[default blue orange]

  attr_accessor :secret_key

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :favicon, Project::FaviconUploader

  belongs_to :user

  validates :name, :page_title, :url_scheme, :url_domain, presence: true, on: :update

  validates :name, length: { minimum: 3, maximum: 20 }, on: :update
  validates :page_title, length: { minimum: 3, maximum: 70  }, on: :update

  has_many :project_menu_items, dependent: :destroy

  has_many :entities, class_name: SimpleAdmin::Entity.to_s,  dependent: :destroy
  has_many :widgets,  class_name: SimpleAdmin::Widget.to_s,  dependent: :destroy

  has_many :user_roles, class_name: SimpleAdmin::UserRole.to_s, dependent: :destroy
  has_many :users, class_name: SimpleAdmin::User.to_s, dependent: :destroy

  before_update :encrypt_secret_key!

  after_commit :create_menu_items!, on: :create

  def style_path
    "admin/palettes/#{style}"
  end

  def url
    "#{url_scheme}#{url_domain}"
  end

  def enabled?
    http_code = enabled_request_response_code

    http_code == '200'
  rescue StandardError
    false
  end

  def enabled_request_response_code
    uri = URI.parse("#{url}/#{Simpleadmin::API::Endpoints::V1::Tables::ENDPOINT_URL}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'

    request = Net::HTTP::Get.new(uri.request_uri)
    request['SimpleAdmin-Secret-Key'] = encrypted_secret_key

    http.request(request).code
  rescue StandardError
    '404'
  end

  private

  def encrypt_secret_key!
    return if secret_key.blank?

    self.encrypted_secret_key = ::BCrypt::Password.create(secret_key).to_s
  end

  def create_menu_items!
    ProjectMenuItem::DEFAULT_ITEMS.each do |item_attrs|
      project_menu_items.create(item_attrs)
    end
  end
end
