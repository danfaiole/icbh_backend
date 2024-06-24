class ScheduleNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rpush::Gcm::Notification.create(
    	app: Rpush::Gcm::App.find_by(name: "icbh_android"),
    	registration_ids: RegisteredPhone.pluck(:phone_id),
    	data: {
        message: "" #,
        #screen_title: args[0][:screen_title]
      },
    	priority: 'normal',
    	content_available: true,
    	notification: {
    		body: args[0][:body],
    		title: args[0][:title]
    	}
    )

    Rpush.push
  end
end
