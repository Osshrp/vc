class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :email, :body, :created_at
end
