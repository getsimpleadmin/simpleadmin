module SimpleAdminHelper
  def collection_edit_link(collection_item)
    model_name = collection_item.class.name.demodulize.downcase
    link = "edit_admin_#{model_name}_path"

    public_send(link, collection_item)
  end

  def collection_delete_link(collection_item)
    model_name = collection_item.class.name.demodulize.downcase
    link = "admin_#{model_name}_path"

    public_send(link, collection_item)
  end
end
