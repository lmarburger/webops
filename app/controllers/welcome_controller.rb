class WelcomeController < ApplicationController
  def index
  end

  private

  helper_method :incidents

  def incidents
    pagerduty = Pagerduty.new("1W7HnVqvp7z2ZsBd71fy")
  end
end
