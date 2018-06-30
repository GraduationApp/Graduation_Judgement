Rails.application.routes.draw do
  root 'graduation_pages#home'
  get 'graduation_pages/home'

  get 'graduation_pages/result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
