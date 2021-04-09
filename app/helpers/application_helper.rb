module ApplicationHelper
    def find_class(message, current_user)
      puts 'finding class now'
      puts [current_user.username, message.content, message.user]
      message.user.username == current_user.username ? 'text-right bg-dark' : 'text-left'
    end

    def find_name(message, current_user)
      message.user.username == current_user.username ? 'You' : message.user.username
    end
end
