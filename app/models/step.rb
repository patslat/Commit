class Step
  include Mongoid::Document

  field :date, type: DateTime
  field :work_done, type: Symbol

  validates_presence_of :date
  validates_presence_of :work_done

  validates_inclusion_of :work_done, in: [:minimum, :sufficient, :maximum]

end
