class WinLosePayments


def initialize
@lastPayment=nil
end

def pbWinLosePaymentsTimer
    return false if !@lastPayment
    timenow=pbGetTimeNow
    return timenow.to_i-@lastPayment
end

def pbWinLoseChecker
    if pbWinLosePaymentsTimer >= 86400
    @lastPayment=timenow.to_i
    return true
	else
	return false
	end
end

def pbBattleWinnings(vari)
 if $game_switches[157]==true
  if $game_variables[1] == 1
   if wari == 1 #1 Normal
    $Trainer.money += 500
   elsif wari == 2 #2 Gym Trainer
    $Trainer.money += 750
   elsif wari == 3 #3 Gym Leader
    $Trainer.money += 1000
   elsif wari == 4 #4 Legends/Elite4
    $Trainer.money += 2000
   elsif wari == 5 #Champion
    $Trainer.money += 7500
   end
	$game_variables[423]=+wari
  elsif $game_variables[1] == 2
   if wari == 1 #1 Normal
    $Trainer.money -= 500
   elsif wari == 2 #2 Gym Trainer
    $Trainer.money -= 750
   elsif wari == 3 #3 Gym Leader
    $Trainer.money -= 1000
   elsif wari == 4 #4 Legends/Elite4
    $Trainer.money -= 2000
   elsif wari == 5 #Champion
    $Trainer.money -= 7500
   end
	$game_variables[423]-=wari
  else
   return
  end
end
end
end
