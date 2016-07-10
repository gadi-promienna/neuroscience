class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:create, :new,]
  before_action :require_admin, only: [:edit, :delete]
#GET /article_topic/:article_topic_id/articles
  def index
    @article_topic = ArticleTopic.find(params[:article_topic_id])
    @articles = @article_topic.articles.all

  end

#GET /articles/article_id
  def show
    @article=Article.find(params[:id])
    @article_topic=@article.article_topic
  end

#GET /article_topic/articles/new
  def new
    @article_topic = ArticleTopic.find(params[:article_topic_id])
    @article = Article.new
  end

  def edit
    @article=Article.find(params[:id])
    @article_topic=@article.article_topic
  end

#post /article_topic/articles/new
  def create
    #upload_file
    if(params[:article][:graphic]) then
      uploaded_io = params[:article][:graphic]
      graphic_path = Rails.root.join('public', 'images', uploaded_io.original_filename) 
      File.open(graphic_path, 'wb') do |file|
        file.write(uploaded_io.read)
        params[:article][:graphic] = graphic_path.basename.to_s
      end
      @article = Article.new(article_params)
      else params[:article][:graphic] = "neuron-small.jpg"
    end
    if(admin) then params[:article][:author_id]=1
    end
    @article = Article.new(article_params)
    @article_topic = @article.article_topic
    respond_to do |format|
      if @article.save
        format.html { redirect_to [@article], notice: 'Article topic was successfully created.' }
        format.json { render :show, status: :created, location: @article_topic.articles }
      else
        format.html { render :new }
        format.json { render json: @article_topic.errors, status: :unprocessable_entity }
      end
    end 
  end

  def update
    if(params[:article][:graphic])
      uploaded_io = params[:article][:graphic]
      graphic_path = Rails.root.join('public', 'images', uploaded_io.original_filename) 
      File.open(graphic_path, 'wb') do |file|
        file.write(uploaded_io.read)
      params[:article][:graphic] = graphic_path.basename.to_s
      end
      else params[:article][:graphic] = "neuron-small.jpg"
    end
    if(admin) then params[:article][:author_id]=1
    end
    @article=Article.find(params[:id])
    @article_topic=@article.article_topic
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_topic.articles }
      else
        format.html { render :edit }
        format.json { render json: @article_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @article=Article.find(params[:id])
      @article_topic=@article.article_topic
      @article.destroy
    respond_to do |format|
      format.html { redirect_to [@article_topic, @article], notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content,  :article_topic_id, :author_id, :graphic, :graphic_description, :source)
    end

     def require_login
    unless current_user
      flash[:error] = "Musisz być zalogowany, żeby wykonać tą akcję."
      redirect_to new_session_url # halts request cycle
    end
  end

  def require_admin
    unless admin
      flash[:error] = "Nie jesteś adminem przyjacielu :("
      redirect_to :back # halts request cycle
    end
  end

end