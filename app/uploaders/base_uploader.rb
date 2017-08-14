class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def extension_white_list
    %w[jpg jpeg gif png svg]
  end

  def store_dir
    "storage/#{model.class.base_class.name.underscore}/#{model.id}"
  end

  def filename
    "#{mounted_as}-#{md5}#{File.extname(original_filename)}" if original_filename.present?
  end

  def md5
    chunk = model.send(mounted_as)
    @md5 ||= Digest::MD5.hexdigest(chunk.read.to_s)
  end
end
