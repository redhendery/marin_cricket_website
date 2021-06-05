desc 'Remove Paid flag from all users on January first each year'
task fee_reset: :environment do
  nyd = Date.new(1-1).strftime('%d-%m')
  if Date.current.strftime('%d-%m') === nyd
    users = User.all
    users.update(paid: false)
    UserMailer.fee_reset.deliver_now
  end
end
