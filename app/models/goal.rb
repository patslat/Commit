class Goal
  include Mongoid::Document

  field :description, type: String

  validates_presence_of :description
  validates_presence_of :daily_goal

  belongs_to :user

  embeds_one :daily_goal
  embeds_many :steps
end
