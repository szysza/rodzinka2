# encoding: utf-8

class AddData < ActiveRecord::Migration
  def up
    user1 = User.new(email: 'user@user.pl', password: 'pass', password_confirmation: 'pass',
                     gender: 'male', first_name: 'Konrad', last_name: 'Bąk')
    user1.save!

    user1.create_family(name: "Rodzina Bąk")
    user1.create_family(name: "Rodzina Popławskich")

    user2 = User.new(email: 'adam@adam.pl', password: 'pass', password_confirmation: 'pass',
                     gender: 'male', first_name: 'Adam', last_name: 'Nowak')
    user2.save!

    user1.build_invitations_for(user2).each(&:save!)
  end

  def down
    User.destroy_all
    Family.destroy_all
  end
end
