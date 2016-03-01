class GoalDataPtsController < ApplicationController
  before_action :set_goal_data_pt, only: [:show, :edit, :update, :destroy]

  # GET /goal_data_pts
  # GET /goal_data_pts.json
  def index
    @goal_data_pts = GoalDataPt.all
  end

  # GET /goal_data_pts/1
  # GET /goal_data_pts/1.json
  def show
  end

  # GET /goal_data_pts/new
  def new
    @goal_data_pt = GoalDataPt.new
  end

  # GET /goal_data_pts/1/edit
  def edit
  end

  # POST /goal_data_pts
  # POST /goal_data_pts.json
  def create
    @goal_data_pt = GoalDataPt.new(goal_data_pt_params)

    respond_to do |format|
      if @goal_data_pt.save
        format.html { redirect_to @goal_data_pt, notice: 'Goal data pt was successfully created.' }
        format.json { render :show, status: :created, location: @goal_data_pt }
      else
        format.html { render :new }
        format.json { render json: @goal_data_pt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_data_pts/1
  # PATCH/PUT /goal_data_pts/1.json
  def update
    respond_to do |format|
      if @goal_data_pt.update(goal_data_pt_params)
        format.html { redirect_to @goal_data_pt, notice: 'Goal data pt was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_data_pt }
      else
        format.html { render :edit }
        format.json { render json: @goal_data_pt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_data_pts/1
  # DELETE /goal_data_pts/1.json
  def destroy
    @goal_data_pt.destroy
    respond_to do |format|
      format.html { redirect_to goal_data_pts_url, notice: 'Goal data pt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_data_pt
      @goal_data_pt = GoalDataPt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_data_pt_params
      params.require(:goal_data_pt).permit(:data_pt_num, :perceived_performance, :perceived_progress, :actual_progress, :goal_id)
    end
end
