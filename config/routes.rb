Rails.application.routes.draw do
  resources :companies
  resources :students
  resources :internships

  get "students/:id/internships", to: "students#internships_by_student"
  get "companies/:id/interns", to: "companies#interns_by_company"
  post "login", to: "sessions#create"
  post "signup", to: "users#create"
  get "users", to: "users#index"
  put "users/:id", to: "users#update"
  get "users/:id", to: "users#show"
  put "users/:id/admin", to: "users#toggle_admin"
end
