require 'rho/rhocontroller'

class FloginController < Rho::RhoController

  def index
    render
  end

  def do_login
    @params['thread'] = 'ui'
    @params['callback'] = url_for :action => 'login_callback'
    System.syscall("login",@params)    
    render :action => :login
  end
  
  def login_callback
    puts "login_callback called " + @params.inspect
    WebView.navigate url_for :action => 'index', :query => @params
  end  

end
