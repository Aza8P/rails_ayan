class FakeJob < ApplicationJob
  queue_as :default 

  def perform(user_id)
    # change to send email to the user after booking is confirmed
    user = User.find(user_id)
    puts "Calling #{user.name}}"
    sleep 3
    puts "im done with the fake job"
  end
end
