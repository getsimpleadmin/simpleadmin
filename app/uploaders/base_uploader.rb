# frozen_string_literal: true

class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    model_dir = "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"

    "system/uploads/#{model_dir}"
  end

  def default_url
    ActionController::Base.helpers.asset_path '/' + [model.class.to_s.underscore,
                                                     mounted_as, version_name, 'default.png'].compact.join('_')
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
