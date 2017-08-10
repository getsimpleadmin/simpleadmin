module SimpleAdmin
  module ApplicationRecordExt
    def get_field(field_name)
      public_send(field_name)
    end

    def get_association_field(field_name)
      # TODO: Hardcoded value
      get_field(field_name.gsub(/_id/, '')).name
    end

    def get_image_field(field_name)
      public_send("#{field_name}_url", :admin_thumb)
    end
  end
end
