
EventHandlers.add(:on_end_battle, :check_achievements,
  proc { |decision, _canLose|
  if decision ==1
      pbAchievementGet(0)
  end
  }
)