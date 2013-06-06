Rails.application.routes.draw do
  mount RakeControlWeb::Engine => "/rake_control"
end
