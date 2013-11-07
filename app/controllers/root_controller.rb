class RootController < ApplicationController
  before_filter :require_current_user!, :only => :root
  before_filter :require_no_current_user!, :only => :welcome

  def root
  end

  def welcome
  end
end
