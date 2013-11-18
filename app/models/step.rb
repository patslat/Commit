class Step
  include Mongoid::Document

  field :date, type: DateTime, default: DateTime.now
  field :work_done, type: Symbol, default: :minimum
  field :description, type: String

  validates_presence_of :date
  validates_presence_of :work_done

  validates_uniqueness_of :date

  validates_inclusion_of :work_done, in: [:minimum, :sufficient, :maximum]

  embedded_in :goal, class_name: "Goal", inverse_of: :steps


end
