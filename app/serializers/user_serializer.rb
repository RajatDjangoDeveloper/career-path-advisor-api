class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :gender, :dob, :role
end
