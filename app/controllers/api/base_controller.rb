class Api::BaseController < ApplicationController
  respond_to :json
  before_action :default_json
  skip_before_filter :verify_authenticity_token

  protected

  def default_json
    request.format = :json if params[:format].nil?
  end
end
