class PagesController < ApplicationController
  def home
@title="Home"
  end

def about
  @title="About us"
  end
  
  

  def products
  @title="Products"
  end

  def services
  @title="Services"
  end
end
