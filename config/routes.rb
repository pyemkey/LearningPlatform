# == Route Map (Updated 2014-04-01 20:32)
#
#                   Prefix Verb   URI Pattern                                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                      devise/sessions#destroy
#            user_password POST   /users/password(.:format)                      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                 devise/passwords#edit
#                          PATCH  /users/password(.:format)                      devise/passwords#update
#                          PUT    /users/password(.:format)                      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                        devise/registrations#cancel
#        user_registration POST   /users(.:format)                               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                          devise/registrations#edit
#                          PATCH  /users(.:format)                               devise/registrations#update
#                          PUT    /users(.:format)                               devise/registrations#update
#                          DELETE /users(.:format)                               devise/registrations#destroy
#           course_lessons GET    /courses/:course_id/lessons(.:format)          lessons#index
#                          POST   /courses/:course_id/lessons(.:format)          lessons#create
#        new_course_lesson GET    /courses/:course_id/lessons/new(.:format)      lessons#new
#       edit_course_lesson GET    /courses/:course_id/lessons/:id/edit(.:format) lessons#edit
#            course_lesson GET    /courses/:course_id/lessons/:id(.:format)      lessons#show
#                          PATCH  /courses/:course_id/lessons/:id(.:format)      lessons#update
#                          PUT    /courses/:course_id/lessons/:id(.:format)      lessons#update
#                          DELETE /courses/:course_id/lessons/:id(.:format)      lessons#destroy
#                  courses GET    /courses(.:format)                             courses#index
#                          POST   /courses(.:format)                             courses#create
#               new_course GET    /courses/new(.:format)                         courses#new
#              edit_course GET    /courses/:id/edit(.:format)                    courses#edit
#                   course GET    /courses/:id(.:format)                         courses#show
#                          PATCH  /courses/:id(.:format)                         courses#update
#                          PUT    /courses/:id(.:format)                         courses#update
#                          DELETE /courses/:id(.:format)                         courses#destroy
#                     page GET    /pages/*id                                     high_voltage/pages#show
#

LearningPlatform::Application.routes.draw do
  root "dashboard#home"
  devise_for :users
  resources :users
  resources :courses do
    resources :lessons
  end
  
end
