u = User.create!(username: "patslat", email: "patslat", password: "patslat")

steps = (DateTime.now - 10.days..DateTime.now).map do |date|
  Step.new({
    date: date,
    work_done: [:maximum, :sufficient, :minimum].sample,
    description: 'did stuff'
  })
end

g = u.goals.create!(
  description: "Write code every day",
  steps: steps,
  daily_goal: {
    minimum: "Refactor a method",
    sufficient: "Implement a feature",
    maximum: "Build an app"
  }
)

steps = (DateTime.now - 100.days..DateTime.now).map do |date|
  next if (rand * 2).to_i == 0
  Step.new({
    date: date,
    work_done: [:maximum, :sufficient, :minimum].sample,
    description: 'did stuff'
  })
end.compact!

g = u.goals.create!(
  description: "Work out every day",
  steps: steps,
  daily_goal: {
    minimum: "Do some push-ups",
    sufficient: "Run a mile or lift some weights",
    maximum: "Go to the gym for an hour"
  }
)

steps = (DateTime.now - 100.days..DateTime.now).map do |date|
  next if (rand * 2).to_i == 0
  Step.new({
    date: date,
    work_done: [:maximum, :sufficient, :minimum].sample,
    description: 'did stuff'
  })
end.compact!

g = u.goals.create!(
  description: "Clean some stuff",
  steps: steps,
  daily_goal: {
    minimum: "Put something away",
    sufficient: "Fold some clothes / Do some dishes",
    maximum: "Fold all of the clothes / Do all of the Dishes"
  }
)
