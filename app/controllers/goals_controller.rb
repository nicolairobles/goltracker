require 'twilio-ruby'

class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
      # prepare translation into minutes 
        time_allotted_units = params[:time_allotted_units]
        time_allotted = params[:goal][:time_allotted]
        goal_id = @goal.id
        calculate_minutes_texts(time_allotted, time_allotted_units, goal_id)
      # prepare Twilio data for sending initial text
        goal_title = @goal.goal_title
        goal_user_id = @goal.user_id
        member = User.find_by(id: goal_user_id)
        phone_number = member.phone_number.floor
        trigger_initial_message(goal_title, phone_number)
      # regular business
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

# send initial text message
  def trigger_initial_message(goal_title, phone_number)
    @content = "
      you're now tracking goal: #{goal_title}"
    send_message(phone_number, @content)
  end

# Set number of times a text will be sent through the allotted time
  def num_texts(minutes)
    if minutes > 0 && minutes <= 60 # 1hr
      data_pts = 2
    elsif minutes > 60 && minutes <= 300 #5hr
      data_pts = 3
    elsif minutes > 300 && minutes <= 1440 #24hr
      data_pts = 4
    elsif minutes > 1440 && minutes <= 2880 #2 days
      data_pts = 6
    elsif minutes > 2880 && minutes <= 7200 #5 days
      data_pts = 12
    elsif minutes > 7200 && minutes <= 30240 #1 wk
      data_pts = 14
    elsif minutes > 30240 && minutes <= 40320 # 3 wks
      data_pts = 9
    elsif minutes > 40320 && minutes <= 241920 #1 mo
      data_pts = 25
    elsif minutes > 241920 && minutes <= 443520 #6 mo-11mo
      data_pts = 22
    end
    data_pts
  end 

# Calcuate minutes based on times provided
  def calculate_minutes_texts(time_allotted, time_allotted_units, goal_id)
    if(time_allotted_units = 1) # hours
      minutes = time_allotted.to_i * 60
    elsif (time_allotted_units = 2) # days
      minutes = time_allotted.to_i * 60 * 24
    elsif (time_allotted_units = 3) # weeks
      minutes = time_allotted.to_i * 60 * 24 * 7
    elsif (time_allotted_units = 4) # months
      minutes = time_allotted.to_i * 60 * 24 * 7 * 4
    elsif (time_allotted_units = 5) # years
      minutes = time_allotted.to_i * 60 * 24 * 7 * 4 * 12
    end
    # update minutes in each goal
    goal = Goal.where("id = #{goal_id}").first
    goal.update(time_allotted: minutes)
    # update total_data_pts for the number of texts to be sent
    data_pts = num_texts(minutes)
    goal.update(total_data_pts: data_pts)

    data_pts.times do |n|
      @data_pt = GoalDataPt.create(goal_id: goal_id, data_pt_num:n)
    end

  end



  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:goal_title, :time_allotted, :time_allotted_units, :goal_description, :goal_potential_met, :total_data_pts, :time_recommendation, :track_time, :speed_recommendation, :user_id)
    end

    def send_message(phone_number, content)
      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      message = @client.account.messages.create(
          :from => @twilio_number,
          :to => phone_number,
          :body => content,
        )
      puts message.to
    end 

end
