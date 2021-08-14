class HeartbeatController < ApplicationController
  def heartbeat
    render json: ApplicationRecord.connection.select_all("SELECT 'OK' as HEALTH").first
  end
end
