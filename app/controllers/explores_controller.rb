class ExploresController < ApplicationController
  before_action :set_explore, only: %i[ show edit update destroy ]
  require 'http'

  # GET /explores or /explores.json
  def index
  end

  # GET /explores/1 or /explores/1.json
  def show
    @explores = Explore.all
    @posts = Post.all
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://recipesapi2.p.rapidapi.com/recipes/#{params[:hashtag_search]}?maxRecipes=10")
    puts "https://recipesapi2.p.rapidapi.com/recipes/#{params[:hashtag_search]}?maxRecipes=10"
    puts explore_params[:hashtag_search]
    puts "HHHH"
    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #
    # request = Net::HTTP::Get.new(url)
    # request["X-RapidAPI-Host"] = 'recipesapi2.p.rapidapi.com'
    # request["X-RapidAPI-Key"] = '4a92f1d450msh17a2e5659d3ab54p130911jsn608bfcae348a'
    #
    # response = http.request(request)
    # puts response.read_body
    #
    # puts "WE END HERE"
    # json = JSON.parse(response.body)
    # @result = json["data"]
    # puts @result

  end

  # GET /explores/new
  def new
    @explore = Explore.new
  end

  # GET /explores/1/edit
  def edit
  end

  # POST /explores or /explores.json
  def create
    @explore = Explore.new(explore_params)

    respond_to do |format|
      if @explore.save
        format.html { redirect_to explore_url(@explore), notice: 'Explore was successfully created.' }
        format.json { render :show, status: :created, location: @explore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @explore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /explores/1 or /explores/1.json
  def update
    respond_to do |format|
      if @explore.update(explore_params)
        format.html { redirect_to explore_url(@explore), notice: 'Explore was successfully updated.' }
        format.json { render :show, status: :ok, location: @explore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @explore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /explores/1 or /explores/1.json
  def destroy
    @explore.destroy

    respond_to do |format|
      format.html { redirect_to explores_url, notice: 'Explore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_explore
    @explore = Explore.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def explore_params
    params.require(:explore).permit( :hashtag_search)
  end
end
