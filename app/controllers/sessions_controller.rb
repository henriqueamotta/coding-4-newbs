class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :home, :index ]
  
    def home
    end
  
    def index
    end
  
    def show
    end
end
  