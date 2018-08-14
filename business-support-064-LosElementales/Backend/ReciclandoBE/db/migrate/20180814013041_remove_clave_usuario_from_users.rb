class RemoveClaveUsuarioFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :clave_usuario, :string
  end
end
