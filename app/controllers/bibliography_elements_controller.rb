class BibliographyElementsController < ApplicationController
  before_action :set_bibliography_element, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:create, :new,]
  before_action :require_admin, only: [:edit, :delete]

  # GET /bibliography_elements
  # GET /bibliography_elements.json
  def index
    @bibliography_elements = BibliographyElement.all
  end

  # GET /bibliography_elements/1
  # GET /bibliography_elements/1.json
  def show
  end

  # GET /bibliography_elements/new
  def new
    @bibliography_element = BibliographyElement.new
  end

  # GET /bibliography_elements/1/edit
  def edit
  end

  # POST /bibliography_elements
  # POST /bibliography_elements.json
  def create
    @bibliography_element = BibliographyElement.new(bibliography_element_params)

    respond_to do |format|
      if @bibliography_element.save
        format.html { redirect_to @bibliography_element, notice: 'Bibliography element was successfully created.' }
        format.json { render :show, status: :created, location: @bibliography_element }
      else
        format.html { render :new }
        format.json { render json: @bibliography_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibliography_elements/1
  # PATCH/PUT /bibliography_elements/1.json
  def update
    respond_to do |format|
      if @bibliography_element.update(bibliography_element_params)
        format.html { redirect_to @bibliography_element, notice: 'Bibliography element was successfully updated.' }
        format.json { render :show, status: :ok, location: @bibliography_element }
      else
        format.html { render :edit }
        format.json { render json: @bibliography_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliography_elements/1
  # DELETE /bibliography_elements/1.json
  def destroy
    @bibliography_element.destroy
    respond_to do |format|
      format.html { redirect_to bibliography_elements_url, notice: 'Bibliography element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bibliography_element
      @bibliography_element = BibliographyElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bibliography_element_params
      params.require(:bibliography_element).permit(:friendly_name, :source, :description)
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
