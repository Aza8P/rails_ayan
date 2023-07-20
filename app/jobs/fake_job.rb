class FakeJob < ApplicationJob
  queue_as :default 

  def perform(user_id)
    # Do something later
    user = User.find(user_id)
    puts "Calling #{user.name}}"
    sleep 3
    puts "im done with the fake job"
  end
end
