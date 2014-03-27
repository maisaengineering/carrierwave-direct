CarrierwaveDirect::Application.routes.draw do
  root :to => 'documents#new'
  resources :documents, :only => [:new, :create, :show]
  resource :attachment, :only => :new
end
