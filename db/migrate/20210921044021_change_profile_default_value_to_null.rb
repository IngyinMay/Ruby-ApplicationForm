class ChangeProfileDefaultValueToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :applicants, :profile_photo, true
  end
end
