# frozen_string_literal: true

class AddIssueRequestToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :issue_request, :boolean, default: false
  end
end
