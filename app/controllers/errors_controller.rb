class ErrorsController < ApplicationController
  layout 'error_layout'
  skip_before_filter :authenticate_user!

  def render_error_401
    respond_to_error(401)
  end

  def render_error_404
    respond_to_error(404)
  end

  def render_error_422
    respond_to_error(422)
  end

  def render_error_500
    respond_to_error(500)
  end

  private
  def respond_to_error(error)
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/#{error}.html", status: error }
    end
  end
end
