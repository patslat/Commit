require 'spec_helper'

describe Goal do
  it { should allow_mass_assignment_of :description }

  it { should belong_to(:user).as_inverse_of :goals  }

  it { should embed_one :daily_goal }
  it { should embed_many :steps }

  it { should validate_presence_of :description }
  it { should validate_presence_of :daily_goal }
end
