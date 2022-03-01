class Api::V2::TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :deadline, :done, :user_id,
              :created_at, :updated_at, :short_description, :is_late

  belongs_to :user

  def short_description 
    object.description[0..40]
  end

  def is_late 
    Time.current > object.deadline if object.deadline.present?
  end

end
