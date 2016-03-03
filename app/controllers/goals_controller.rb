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
        calculate_minutes(time_allotted, time_allotted_units, goal_id)
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

  def calculate_minutes(time_allotted, time_allotted_units, goal_id)
    if(time_allotted_units = 1) # hours
      minutes = time_allotted.to_i * 60
    elsif (time_allotted_units = 2) # days
      minutes = time_allotted.to_i * 60 * 24
    elsif (time_allotted_units = 3) # weeks
      minutes = time_allotted.to_i * 60 * 24 * 7
    elsif (time_allotted_units = 4) # years
      minutes = time_allotted.to_i * 60 * 24 * 7 * 52
    end
    goal = Goal.where("id = #{goal_id}").first
    goal.update(time_allotted: minutes)
  end 

  def trigger_initial_message(goal_title, phone_number)
    @content = "
      you're now tracking goal: #{goal_title}"
    send_message(phone_number, @content)
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
          # US phone numbers can make use of an image as well.
        )
      puts message.to
    end 

end
