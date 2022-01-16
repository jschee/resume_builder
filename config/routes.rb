Rails.application.routes.draw do
  root "resumes#index"
  resources :resumes do
    resources :authors, module: :resumes
    resources :projects, module: :resumes
    resources :experiences, module: :resumes
    resources :educations, module: :resumes
    resources :skills, module: :resumes
    # get '/download_resume', to: 'resumes#download_resume', as: 'download_resume'
  end
end
