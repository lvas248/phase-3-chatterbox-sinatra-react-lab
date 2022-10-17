class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    Message.all.order(:created_at).to_json
  end

  post '/messages' do
    new_message = Message.create(username:params[:username], body:params[:body])
    new_message.to_json
  end

  patch '/messages/:id' do
    # find the message
    message = Message.find(params[:id])
    #update the message in the DB
    message.update(
      body: params[:body]
    )
    #return the message in JSON format
    message.to_json
  end

  delete '/messages/:id' do
    #find the message
    message = Message.find(params[:id])
    #destroy the message
    message.destroy
    #return the destroyed message in JSON format
    message.to_json
  end
end
