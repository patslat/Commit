require 'spec_helper'

describe DailyGoal do
  it { should allow_mass_assignment_of :minimum }
  it { should allow_mass_assignment_of :sufficient }
  it { should allow_mass_assignment_of :maximum }

  it { should be_embedded_in(:goal).as_inverse_of :daily_goal }

  it { should validate_presence_of :minimum }
  it { should validate_presence_of :sufficient }
  it { should validate_presence_of :maximum }
end
