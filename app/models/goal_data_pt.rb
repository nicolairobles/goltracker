class GoalDataPt < ActiveRecord::Base
  belongs_to :goal

  after_create :reminder

  # Notify our appointment attendee X minutes before the appointment time
  def reminder
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    
    # get necessary details to schedule reminder from goal and user
    @goal = Goal.where("id = #{self.goal_id}").first
    minutes = @goal.time_allotted
    data_pts = @goal.total_data_pts

    @user = User.where("id = #{@goal.user_id}").first
    phone_number = @user.phone_number.floor
    goal_title = @goal.goal_title
    # call a function to automate the series of texts to run 

    reminder = "How are you doing on your goal: #{goal_title}. Respond with your rating on a scale from 1 to 10 (eg, 8/10)"
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => reminder,
    )
    puts message.to
  end

	def when_to_run
		  # get self.goal info
		  goal = Goal.where("id = #{self.goal_id}").first
		  minutes = goal.time_allotted
		  data_pts = goal.total_data_pts
		  minute_interval = minutes/data_pts

		  interval_num = self.data_pt_num

			Time.now + minute_interval*(interval_num+1).minutes
			
	end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
