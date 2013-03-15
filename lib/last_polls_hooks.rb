class LastPollsHooks < Redmine::Hook::ViewListener

  def view_welcome_index_right(context = { })
    if User.current.projects.any? && User.current.logged?
      if context[:hook_caller].respond_to?(:render)
        context[:hook_caller].send(:render, {:locals => {:polls => VotingPoll.unvoted_for_all()}.merge(context), :partial => '/polls/polls_box'})
      elsif context[:controller].is_a?(ActionController::Base)
        context[:controller].send(:render_to_string, {:locals => {:polls => VotingPoll.unvoted_for_all()}.merge(context), :partial => '/polls/polls_box'})
      end
    end
  end

  def view_projects_show_right(context = { })
    project = context[:project]

    if User.current.logged?
      if context[:hook_caller].respond_to?(:render)
        context[:hook_caller].send(:render, {:locals => {:polls => VotingPoll.unvoted(project.id)}.merge(context), :partial => '/polls/polls_box'})
      elsif context[:controller].is_a?(ActionController::Base)
        context[:controller].send(:render_to_string, {:locals => {:polls => VotingPoll.unvoted(project.id)}.merge(context), :partial => '/polls/polls_box'})
      end
    end


  end
end
