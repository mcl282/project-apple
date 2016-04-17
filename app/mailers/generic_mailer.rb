class GenericMailer < ApplicationMailer
    client = SendGrid::Client.new(api_key: 'SENDGRID_APIKEY')
    
end
