Rails.application.routes.draw do
  resources :companies
  resources :students
  resources :internships

  get "students/:id/internships", to: "students#internships_by_student"
  get "companies/:id/interns", to: "companies#interns_by_company"
end
