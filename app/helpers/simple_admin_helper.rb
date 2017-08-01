module SimpleAdminHelper
  def resource_link(resource, method, prefix = nil, namespace = nil)
    # TODO Hardcoded values
    default_models = {
      SimpleAdmin::Post => {
        index:   :admin_posts_path,
        new:     :new_admin_post_path,
        create:  :admin_posts_path,
        edit:    :edit_admin_post_path,
        update:  :admin_post_path,
        destroy: :admin_post_path
      },
      SimpleAdmin::Category => {
        index:   :admin_categories_path,
        new:     :new_admin_category_path,
        create:  :admin_categories_path,
        edit:    :edit_admin_category_path,
        update:  :admin_category_path,
        destroy: :admin_category_path
      }
    }

    if default_models.include?(resource.class)
      return public_send(default_models[resource.class][method], resource, current_locale)
    end

    case method
    when :index
      resource_name = resource.model_name.plural
    when :new
      resource_name = resource.model_name.singular
      prefix = :new
    when :create
      resource_name = resource.model_name.plural
    when :edit
      resource_name = resource.model_name.singular
      prefix = :edit
    when :update
      resource_name = resource.model_name.singular
    when :destroy
      resource_name = resource.model_name.singular
    end

    resource_path = "#{namespace}_#{resource_name}_path"
    resource_path = "#{prefix}_#{resource_path}" if prefix.present?

    public_send(resource_path, resource, current_locale)
  end

  def resource_collection_title(resource)
    "simple_admin.admin.#{resource.model_plural_name}.index.title"
  end

  def resource_collection_link(resource, current_locale)
    public_send("admin_#{resource.model_plural_name}_path", current_locale)
  end

  def str_to_method(string)
    # TODO Eval not recommended to use, think about another way
    eval(string)
  end
end
