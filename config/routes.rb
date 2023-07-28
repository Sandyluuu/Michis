Rails.application.routes.draw do
  resources :posts
  # Devise
  devise_for :users,  controllers: { registrations: 'registrations' },
                      path: '',
                      path_names: { sign_in: 'inicia_sesion',
                                    sign_out: 'logout',
                                    sign_up: 'registrate' }
  # Paginas estaticas
  get 'pages/home'
  get 'pages/terms'

  post '/new_user_reaction', to: 'reactions#new_user_reaction', as:'new_user_reaction'

  # Ruta raiz
  root 'pages#home'
end

