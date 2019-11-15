class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 0,
      width: 100, height: 100, crop: :thumb, gravity: :face
  end

  IDENTIFIERS = ["image/upload/v1573645921/l1ymj0tsdh3bummur0fw.jpg", "image/upload/v1573645922/tzedp2yiquftxsngsjde.jpg", "image/upload/v1573646703/xqrn8xwt5vgmjddhmywv.jpg", "image/upload/v1573647055/slevqxe6jqu5sdmyyff2.jpg", "image/upload/v1573647432/njfxgtirlywgbkshmrw6.jpg", "image/upload/v1573647591/sauhmsophclgyjrdp3ah.jpg"]

  def remove!
    ap self.identifier
    ap IDENTIFIERS
    super unless IDENTIFIERS.map {|id| id.split('/').last }.include?(self.identifier.split('/').last)
  end
end
