task({ :reminder_text => :environment }) do
  sinch_plan_id = ENV.fetch("SINCH_PLAN_ID")
  sinch_api_token = ENV.fetch("SINCH_API_TOKEN")

  unique_user_ids = Habitlog.distinct.pluck(:user_id).compact
  message_data = unique_user_ids.each_with_object({}) do |user_id, hash|
    habitlog = Habitlog.where(user_id: user_id).first
    user = User.where(id: user_id).first
    
    if habitlog && user
      hash[user_id] = {
        motivation: habitlog.Motivation,
        phone_number: user.phone_number
      }
    end
  end

  message_data.each do |user_id, details|
    motivation = details[:motivation]
    phone_number = "1#{details[:phone_number]}"

        url = "https://sms.api.sinch.com/xms/v1/#{sinch_plan_id}/batches"

        json_request_data = {
          from: ENV.fetch("SINCH_SENDING_NUMBER"),
          to: ["#{phone_number}"],
          body: "#{motivation} Log your daily habit goals -> https://habitbybit.onrender.com/backdoor"
        }

        client = HTTP.auth("Bearer #{sinch_api_token}").headers(accept: "application/json")
        client.post(url, json: json_request_data)
      end

end
