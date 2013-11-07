require 'spec_helper'

describe Step do
  it { should allow_mass_assignment_of :date }
  it { should allow_mass_assignment_of :work_done }

  it { should be_embedded_in(:goal).as_inverse_of :steps }

  it { should validate_presence_of :date }
  it { should validate_presence_of :work_done }
end
