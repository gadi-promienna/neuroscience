class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:create, :new,]
  before_action :require_admin, only: [:edit, :delete]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/find
  # This method find phrases in news content and title.
   def find
    @seek = params[:find]
    @news = News.all.select{|new|
           if(new.content.downcase.include?(@seek)) then true
           elsif new.title.downcase.include?(@seek) then true
           end
        }
    render "index"
  end


  def typ
    @kind = params[:kind]
    @news = News.all.select{|new|
           if(new.kind==@kind)then true
           end
        }
    render "index"
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    #upload file
      if(params[:news][:graphic])
        uploaded_io = params[:news][:graphic]
        image_path = Rails.root.join('public', 'images', uploaded_io.original_filename) 
        File.open(image_path, 'wb') do |file|
          file.write(uploaded_io.read)
        params[:news][:graphic] = image_path.basename.to_s
      end
       @news = News.new(news_params)
     else params[:news][:graphic] = "neuron-small.jpg"
    end
    if(admin) then params[:news][:author_id]=1
    end
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    if(params[:news][:graphic])
      uploaded_io = params[:news][:graphic]
      image_path = Rails.root.join('public', 'images', uploaded_io.original_filename) 
      File.open(image_path, 'wb') do |file|
        file.write(uploaded_io.read)
      params[:news][:graphic] = image_path.basename.to_s
      end
      else params[:news][:graphic] = "neuron-small.jpg"
    end
    if(admin) then params[:news][:author_id]=1
    end
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:date, :title, :kind, :content, :author_id, :graphic, :graphic_description, :source)
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
