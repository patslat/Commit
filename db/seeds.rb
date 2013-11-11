u = User.create!(username: "patslat", email: "patslat", password: "patslat")

steps = (Date.new - 10.days..Date.new).map do |date|
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

