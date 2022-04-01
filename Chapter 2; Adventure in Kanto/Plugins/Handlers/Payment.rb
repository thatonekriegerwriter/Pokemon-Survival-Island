class WinLosePayments


def initialize
@lastPayment=nil
end

def pbWinLosePayments
    return false if !@lastPayment
    timenow=pbGetTimeNow
    return timenow.to_i-@lastPayment<86400
    @lastPayment=timenow.to_i
end


end