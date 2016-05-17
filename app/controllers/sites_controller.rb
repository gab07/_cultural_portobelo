class SitesController < ApplicationController
  def admin_panel
    @books = Book.all
  end
end
