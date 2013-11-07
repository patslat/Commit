class Goal
  include Mongoid::Document

  field :description, type: String

  belongs_to :user

  embeds_one :daily_goal
  embeds_many :steps
end
