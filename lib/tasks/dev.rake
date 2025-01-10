task({ :reminder_text => :environment }) do
sinch_plan_id = ENV.fetch("SINCH_PLAN_ID")
sinch_api_token = ENV.fetch("SINCH_API_TOKEN")

latest_habit = Habitlog.order(created_at: :desc).at(0)
motivation_text = latest_habit.Motivation

User.find_each do |user|
  latest_habit = user.habitlogs.order(created_at: :desc).first
  motivation_text = latest_habit.motivation
  phone_number = "1#{phone_number}"

  url = "https://sms.api.sinch.com/xms/v1/#{sinch_plan_id}/batches"

  json_request_data = {
      "from": ENV.fetch("SINCH_SENDING_NUMBER"),
      "to": [phone_number],
      "body": " #{motivation_text} Log your daily habit goals -> https://habitbybit.onrender.com/backdoor"
    }

  client = HTTP.auth("Bearer #{sinch_api_token}").headers(:accept => "application/json")

  client.post(url, :json => json_request_data)
  end
end
