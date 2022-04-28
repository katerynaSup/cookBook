class SearchesController < ApplicationController
  before_action :set_search, only: %i[ show edit update destroy ]

  # GET /searches or /searches.json
  def index
    @searches = Search.all
  end

  # GET /searches/1 or /searches/1.json
  def show
    @explores = Explore.all
    @search = Search.find(params[:id])
    @posts = Post.all
    require 'uri'
    require 'net/http'
    require 'openssl'
    @actual_tag = @search.search_tag
    new_tag = render_search_tag
    url = URI("https://recipesapi2.p.rapidapi.com/recipes/#{new_tag}?maxRecipes=10")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    puts "https://recipesapi2.p.rapidapi.com/recipes/#{new_tag}?maxRecipes=10"

    request = Net::HTTP::Get.new(url)
    request['X-RapidAPI-Host'] = 'recipesapi2.p.rapidapi.com'
    request['X-RapidAPI-Key'] = '4a92f1d450msh17a2e5659d3ab54p130911jsn608bfcae348a'

    response = http.request(request)
    puts response.read_body

    puts 'WE END HERE'
    json = JSON.parse(response.body)
    @result = json['data']
    puts @result
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # GET /searches/1/edit
  def edit
  end

  # POST /searches or /searches.json
  def create
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.save
        format.html { redirect_to search_url(@search), notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /searches/1 or /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to search_url(@search), notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1 or /searches/1.json
  def destroy
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_search
    @search = Search.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def search_params
    params.require(:search).permit(:search_tag)
  end

  def render_search_tag
    temp = @search.search_tag
    temp[' '] = '%20' if temp.index(' ')
    temp
  end
end
