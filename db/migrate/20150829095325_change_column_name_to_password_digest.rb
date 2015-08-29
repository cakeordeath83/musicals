class ChangeColumnNameToPasswordDigest < ActiveRecord::Migration
  def change
    rename_column :visitors, :password, :password_digest
  end
end
