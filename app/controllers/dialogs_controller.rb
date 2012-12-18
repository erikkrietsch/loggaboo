class DialogsController < ApplicationController
  layout "dialogs"
  include UsersHelper
  include LogEntriesHelper
  
  def confirm_entry_delete
    @log_entry = LogEntry.find_by_id(params[:id])
  end
  
end
