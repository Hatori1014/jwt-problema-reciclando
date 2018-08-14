# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
    attributes :id, :nombre_usuario, :apellidos_ususario, :fecha_nacimiento_usuario, :puntaje_usuario, :password, :password_confirmation 
  end