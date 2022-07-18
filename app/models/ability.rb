# frozen_string_literal: true

class Ability
  include CanCan::Ability
  include ApplicationHelper

  def initialize(user)
    if user.is_admin
      can :manage, :all
    else 
      can :read, Book
      can :issue_book_request, Book
      can :cancel_book_request, Book 
    end
  end
end
