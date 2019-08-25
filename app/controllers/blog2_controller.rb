class Blog2Controller < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
    @blog2 = Blog.order("created_at DESC").page(params[:page]).per(1)
  end

  def new
  end

  def create
    Blog.create(name: blog2_params[:name], image: blog2_params[:image], text: blog2_params[:text], user_id: current_user.id)
  end

  def destroy
    blog2 = Blog.find(params[:id])
    if blog2.user_id == current_user.id
      blog2.destroy
    end
  end

  def edit
    @blog2 = Blog.find(params[:id])
  end

  def update
    blog2 = Blog.find(params[:id])
    if blog2.user_id == current_user.id
      blog2.update(blog2_params)
    end
  end

  private
    def blog2_params
      params.permit(:name, :image, :text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
