class PostsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show,:kudos]
  layout :choose_layout

  def index
    @posts = Post.page(params[:page]).per(10).where(draft:false)

    respond_to do |format|
      format.html
      format.xml { render :xml => @posts }
      format.rss { render :layout => false }
    end
  end

  def preview
    @post = Post.new(params[:post])
    @preview = true
    respond_to do |format|
      format.html { render 'show' }
    end
  end

def kudos
    @post = Post.find_by_slug(params[:slug])
    @post.kudos += params[:kudos].to_i
    @post.save
    if params[:kudos].to_i == 1
      session[@post.id.to_s.to_sym] = "true"
    else
      session.delete(@post.id.to_s.to_sym)
    end
    respond_to do |format|
      format.xml { head :ok }
    end
  end

  def admin
    @no_header = true
    @post = Post.new
    @published = Post.where(draft:false).page(params[:post_page]).per(20)
    @drafts = Post.where(draft:true).page(params[:draft_page]).per(20)

    respond_to do |format|
      format.html
    end
  end

  def show
    @single_post = true
    @post = admin? ? Post.find_by_slug(params[:slug]) : Post.find_by_slug_and_draft(params[:slug],false)

    respond_to do |format|
      if @post.present?
        format.html
        format.xml { render :xml => @post }
      else
        format.any { head status: :not_found  }
      end
    end
  end

  def new
    @no_header = true
    @posts = Post.page(params[:page]).per(20)
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml { render xml: @post }
    end
  end

  def edit
    @no_header = true
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/edit/#{@post.id}", :notice => "Post created successfully" }
        format.xml { render :xml => @post, :status => :created, location: @post }
      else
        format.html { render :action => 'new' }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity}
      end
    end
  end

  def update
    @post = Post.find_by_slug(params[:slug])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to "/edit/#{@post.id}", :notice => "Post updated successfully" }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = Post.find_by_slug(params[:slug])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to '/admin' }
      format.xml { head :ok }
    end
  end

  private

  def admin?
    session[:admin] == true
  end

  def choose_layout
    if ['admin', 'new', 'edit', 'create'].include? action_name
      'admin'
    else
      'application'
    end
  end
end
