require 'date'
class BetMailer < ApplicationMailer
  def created_bet
    @bet = params[:bet]
    @time = Time.at(@bet.round.time).to_datetime.strftime("%A, %d %B, %Y at %H:%M")
    mail(to: @bet.user.email, subject: 'Your bet has been successfully created')
  end
end
