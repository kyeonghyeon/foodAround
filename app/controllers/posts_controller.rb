class PostsController < ApplicationController
  #create
  def new
    @universities = University.all

      # 사용자가 데이터를 입력할 화면
      # 자동으로 액션 이름과 같은 화면을 불러서 사용자에게 보여줘
  end
  
  def create
    # 입력받은 데이터를 실제 db에 저장할 액션
    @post = Post.new
    @post.title = params[:input_title]   # migrate 파일에 써준 attribute 이름
    @post.content = params[:input_content]
    @post.university_id = params[:university_id]
    @post.save
    
    # view가 따로 필요없다고 판단 => new화면으로 보내주자
    redirect_to "/posts/show/#{@post.id}"
  end
  
  # read
  def index
    # 모든 post들을 보여주는 view
    @universities = University.all
    if params[:university_id].nil?
      @posts = Post.search(params[:search])
    elsif params[:search].nil?
      @posts = Post.select(params[:university_id])
    else
      @posts = Post.all
    end

  end
  
  def show
    # 한 개의 post를 보여주는 view
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
  end
  
  # update
  def edit
     # 사용자가 데이터를 입력할 화면
    @post = Post.find(params[:post_id])
  end
  
  def update
    # 입력받은 데이터를 실제 db에 저장할 액션
    @post = Post.find(params[:post_id])
    
    # 수정할 코드
    @post.title = params[:input_title]  
    @post.content = params[:input_content]
    @post.save
    
    redirect_to "/posts/show/#{@post.id}"
  end 
  
  # destroy(/delete)
  def destroy
    # 한 개의 post를 삭제하는 액션
    @post = Post.find(params[:post_id])
    @post.destroy
    
    redirect_to '/'
  end
end
