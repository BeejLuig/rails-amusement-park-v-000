class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if too_short && too_poor
      sorry + not_enough_tickets + " " + not_tall_enough
    elsif too_short
      sorry + not_tall_enough
    elsif too_poor
      sorry + not_enough_tickets
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end

  private

  def too_short
    user.height < attraction.min_height
  end

  def too_poor
    user.tickets < attraction.tickets
  end

  def not_tall_enough
    "You are not tall enough to ride the #{attraction.name}."
  end

  def not_enough_tickets
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def sorry
    "Sorry. "
  end
end
