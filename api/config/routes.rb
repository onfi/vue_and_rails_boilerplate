Rails.application.routes.draw do
  get 'api/heartbeat', to: 'heartbeat#heartbeat'
end
