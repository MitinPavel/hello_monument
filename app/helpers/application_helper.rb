module ApplicationHelper
  def thumbnail_img_for(picture_info)
    full_img_for picture_info
  end

  def full_img_for(picture_info)
    url = ::Storage::Facade.instance.thumbnail_url picture_info.data_id

    image_tag url, class: "img-thumbnail"
  end
end
