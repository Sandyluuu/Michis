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

  # Ruta raiz
  root 'pages#home'
end

