class BuildsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  #skip_before_action :authenticate, only: [:create]

  def create
    
    head :ok
  end
end
