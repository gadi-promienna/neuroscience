
class ArticleTopicsController < ApplicationController
  before_action :set_article_topic, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:edit, :create, :new, :delete]

  # GET /article_topics
  # GET /article_topics.json
  def index
    @article_topics = ArticleTopic.all
  end

  # GET /article_topics/1
  # GET /article_topics/1.json
  def show
  end

  # GET /article_topics/new
  def new
    @article_topic = ArticleTopic.new
  end

  # GET /article_topics/1/edit
  def edit
  end

  # POST /article_topics
  # POST /article_topics.json
  def create
     #upload_file
    if(params[:article_topic][:graphic]) then
      uploaded_io = params[:article_topic][:graphic]
      graphic_path = Rails.root.join('public', 'images', uploaded_io.original_filename) 
      File.open(graphic_path, 'wb') do |file|
        file.write(uploaded_io.read)
        params[:article_topic][:graphic] = graphic_path.basename.to_s
      end
      @article_topic = ArticleTopic.new(article_topic_params)
    end

    @article_topic = ArticleTopic.new(article_topic_params)

    respond_to do |format|
      if @article_topic.save
        format.html { redirect_to @article_topic, notice: 'Article topic was successfully created.' }
        format.json { render :show, status: :created, location: @article_topic }
      else
        format.html { render :new }
        format.json { render json: @article_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_topics/1
  # PATCH/PUT /article_topics/1.json
  def update
    if(params[:article_topic][:graphic])
      uploaded_io = params[:article_topic][:graphic]
      graphic_path = Rails.root.join('public', 'images', uploaded_io.original_filename) 
      File.open(graphic_path, 'wb') do |file|
        file.write(uploaded_io.read)
      params[:article_topic][:graphic] = graphic_path.basename.to_s
      end
    end
    respond_to do |format|
      if @article_topic.update(article_topic_params)
        format.html { redirect_to @article_topic, notice: 'Article topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_topic }
      else
        format.html { render :edit }
        format.json { render json: @article_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_topics/1
  # DELETE /article_topics/1.json
  def destroy
    @article_topic.destroy
    respond_to do |format|
      format.html { redirect_to article_topics_url, notice: 'Article topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_topic
      @article_topic = ArticleTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_topic_params
      params.require(:article_topic).permit(:title, :graphic, :description, :graphic_description, :source)
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
