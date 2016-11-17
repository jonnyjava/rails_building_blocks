admin = User.new
admin.name = "Poldo"
admin.first_surname = "de Poldis"
admin.second_surname = " Leopoldibus II"
admin.email = 'admin@pixel.es'
admin.password = 'Dev321'
admin.password_confirmation = 'Dev321'
admin.role = 'admin'
admin.use_of_cookies = true
admin.confirmed_at = Date.today
admin.confirmation_sent_at = Date.today
admin.save!
