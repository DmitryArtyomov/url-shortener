# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  require 'resque/server'
  mount Resque::Server, at: '/admin/jobs'

  defaults format: :json do
    resources :short_urls, only: %i[index create show]
    get '/' => 'short_urls#index'
    get '*id' => 'short_urls#show'
  end
end
