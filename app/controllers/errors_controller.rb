class ErrorsController < ApplicationController
  layout 'error_layout'
  skip_before_filter :authenticate_user!

  def error_401
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/401.html", status: 401 }
    end
  end

  def error_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404.html", status: 404 }
    end
  end

  def error_500
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/500.html", status: 500 }
    end
  end
end
