class LikesCountersController < ApplicationController
  before_action :authenticate_user
  before_action :set_user
  before_action :set_post
  before_action :set_likes_counter, only: %i[ show edit update destroy ]
  

  # GET /likes_counters or /likes_counters.json
  def index
    @likes_counters = LikesCounter.all
  end

  # GET /likes_counters/1 or /likes_counters/1.json
  def show
  end

  # GET /likes_counters/new
  def new
    @likes_counter = LikesCounter.new
  end

  # GET /likes_counters/1/edit
  def edit
  end

  # POST /likes_counters or /likes_counters.json
  def create
    @likes_counter = LikesCounter.new(likes_counter_params)

    respond_to do |format|
      if @likes_counter.save
        format.html { redirect_to likes_counter_url(@likes_counter), notice: "Likes counter was successfully created." }
        format.json { render :show, status: :created, location: @likes_counter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @likes_counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes_counters/1 or /likes_counters/1.json
  def update
    respond_to do |format|
      if @likes_counter.update(likes_counter_params)
        format.html { redirect_to likes_counter_url(@likes_counter), notice: "Likes counter was successfully updated." }
        format.json { render :show, status: :ok, location: @likes_counter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @likes_counter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes_counters/1 or /likes_counters/1.json
  def destroy
    @likes_counter.destroy

    respond_to do |format|
      format.html { redirect_to likes_counters_url, notice: "Likes counter was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def like_post
    puts 'Does not create likes counter'
    LikesCounter.create([{ user: @user, post: @post}]) unless @user.liked_posts.include?(@post)
    redirect_to @user
  end
  
  def unlike_post
    @post.users_who_liked.delete(@user) if @user.liked_posts.include?(@post)
    redirect_to @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_likes_counter
    @likes_counter = LikesCounter.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def likes_counter_params
    params.require(:likes_counter).permit(:user_id, :post_id)
  end
  
  def set_post
    # TODO: find the course using `course_id`
    @post = Post.find_by(id: params[:post_id])
  end

  def set_user
    # TODO: find the user using `course_id`
    @user = User.find_by(id: params[:user_id])
  end
end
