class RepositoriesController < ApplicationController
  def index
    if !user_signed_in?
      render 'pages/intro'
    end
  end
end
