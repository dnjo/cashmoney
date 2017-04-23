Rails.application.routes.draw do
  scope :payments do
    get ':year/:month_num' => 'months#show', as: 'month'
    match ':year/:month_num' => 'months#update', via: %i[post patch], as: 'update_month'
  end

  resources :expenses, except: :new
end
