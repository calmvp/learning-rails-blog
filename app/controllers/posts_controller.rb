class PostsController < ApplicationController

  def new
    @post = Post.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end
  
  def create
  	@post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
      	format.html { redirect_to(@post,
      		  	      :notice => 'Post successful.') }
        format.json { render :json => @post,
         		      :status => :created, :location => @post }
      else 
        format.html { render :action => "new" }
        format.json { render :json => @post.errors,
                      :status => :unprocessable_entity }
      end
    end
  end 

  
  def show
  	@post = Post.find(params[:id])

  	respond_to do |format|
  	  format.html # show.html.erb
  	  format.json { render :json => @post }
  	end
  end

  # private
  
  # def post_params
  # 	params.require(:post).permit(:title, :text)
  # end

end
