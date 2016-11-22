require 'mini-smtp-server'
# This is an SMTP server that logs all
# the messages it receives to STDOUT
class MailServer < MiniSmtpServer

  def new_message_event(message_hash)
    puts "# New email received:"
    puts "-- From: #{message_hash[:from]}"
    puts "-- To:   #{message_hash[:to]}"
    puts "--"
    puts "-- " + message_hash[:data].gsub(/\r\n/, "\r\n-- ")
    puts
  end

end
