if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match 'projects/:project_id/polls' => 'polls#index'
    match 'projects/:project_id/polls/new' => 'polls#new'
    match 'projects/:project_id/polls/:id/edit' => 'polls#edit'
    match 'projects/:project_id/polls/:id/delete' => 'polls#delete'
    match 'projects/:project_id/polls/vote' => 'polls#vote'
    match 'projects/:project_id/polls/new_choice' => 'polls#new_choice'
    match 'projects/:project_id/polls/:poll_id/edit_choice/:id' => 'polls#edit_choice'
    match 'projects/:project_id/polls/:poll_id/reset_vote' => 'polls#reset_vote'
    match 'projects/:project_id/polls/remove_choice/:id' => 'polls#remove_choice'
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.connect 'projects/:project_id/polls', :controller => 'polls', :action => 'index'
    map.connect 'projects/:project_id/polls/new', :controller => 'polls', :action => 'new'
    map.connect 'projects/:project_id/polls/:id/edit', :controller => 'polls', :action => 'edit'
    map.connect 'projects/:project_id/polls/:id/delete', :controller => 'polls', :action => 'delete'
    map.connect 'projects/:project_id/polls/vote', :controller => 'polls', :action => 'vote'
    map.connect 'projects/:project_id/polls/new_choice', :controller => 'polls', :action => 'new_choice'
    map.connect 'projects/:project_id/polls/:poll_id/edit_choice/:id', :controller => 'polls', :action => 'edit_choice'
    map.connect 'projects/:project_id/polls/:poll_id/reset_vote', :controller => 'polls', :action => 'reset_vote'
    map.connect 'projects/:project_id/polls/remove_choice/:id', :controller => 'polls', :action => 'remove_choice'
  end
end
