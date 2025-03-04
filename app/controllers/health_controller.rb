# app/controllers/health_controller.rb
class HealthController < ApplicationController
  def check
    # Check database connectivity
    ActiveRecord::Base.connection.execute("SELECT 1")

    # If everything is fine, return a 200 OK response
    render json: { status: "OK" }, status: :ok
  rescue => e
    # If something is wrong, return a 500 Internal Server Error
    render json: { status: "ERROR", error: e.message }, status: :internal_server_error
  end
end