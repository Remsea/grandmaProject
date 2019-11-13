class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  IDENTIFIERS = ["image/upload/v1573645921/l1ymj0tsdh3bummur0fw.jpg", "image/upload/v1573645922/tzedp2yiquftxsngsjde.jpg", "image/upload/v1573646703/xqrn8xwt5vgmjddhmywv.jpg", "image/upload/v1573647055/slevqxe6jqu5sdmyyff2.jpg", "image/upload/v1573647432/njfxgtirlywgbkshmrw6.jpg", "image/upload/v1573647591/sauhmsophclgyjrdp3ah.jpg"]

  def remove!
    ap self.identifier
    ap IDENTIFIERS
    super unless IDENTIFIERS.map {|id| id.split('/').last }.include?(self.identifier.split('/').last)
  end

end
