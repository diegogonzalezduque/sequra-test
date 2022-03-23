class WeeklyDisbursmentCalculatorJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    # Do something later
    Merchant.each do |merc|
      sum = 0
      sum = merc.orders.where.not(completed_at: nil)where('completed_at > ?', DateTime.now - 7.days).sum(:amount)
      fee = calculate_fee(sum)
      disbursment = WeeklyDisbursment.new(amount: sum, sequra_fee: fee)
      merc.weekly_disbursements << disbursment
      merc.save
    end
  end

  def calculate_fee(sumatory = 0)
    if sumatory < 50
      return sumatory * 0.01
    elsif(sumatory > 50 && sumatory <= 300)
      return sumatory * 0.0095
    elsif(sumatory > 300)
      return sumatory * 0.0085
    end
  end
  
end
