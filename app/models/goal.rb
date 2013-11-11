class Goal
  include Mongoid::Document

  field :description, type: String

  validates_presence_of :description
  validates_presence_of :daily_goal

  belongs_to :user, inverse_of: :goals

  embeds_one :daily_goal, class_name: "DailyGoal"
  embeds_many :steps, class_name: "Step"

end
