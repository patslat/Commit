class DailyGoal
  include Mongoid::Document

  field :minimum, type: String
  field :sufficient, type: String
  field :maximum, type: String

  validates_presence_of :minimum
  validates_presence_of :sufficient
  validates_presence_of :maximum

  embedded_in :goal, class_name: "Goal", inverse_of: :daily_goal
end
