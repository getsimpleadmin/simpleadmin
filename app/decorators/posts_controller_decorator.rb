module PostsControllerDecorator
  def create
    @resource = current_user.posts.build(resource_params)

    if @resource.save
      redirect_to redirect_path, notice: t('.success')
    else
      render :new
    end
  end
end
