class WebsocketsController < WebsocketRails::BaseController
  def initialize_session
    ## Queue up the streaming tweets job
    TwitterStream.new.async.perform
  end
end
