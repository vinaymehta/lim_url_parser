Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  namespace :api do
    post '/save_content' => 'parser#save_content'
    get '/show' => 'parser#index'
  end

  # You can have the root of your site routed with "root"
  root 'home#index'

end
