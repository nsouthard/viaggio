class User < ApplicationRecord
  has_secure_password

  has_many :availabilities
  has_many :budgets
  has_many :location_preferences
  has_many :user_answers
  has_many :locations, through: :location_preferences

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_attachment :image, :presence => true,
    :content_type => { content_type: ["image/jpg", "image/png", "image/jpeg"]  }
 

  def matches
    # find users going to same locations
    users = locations.map { |location| location.users }.flatten.uniq
    users.delete(self)

    # reduce by budget
    users.select! { |user| user.max_budget && user.min_budget}
    min_b = self.min_budget
    max_b = self.max_budget
    users.select! { |user| user.min_budget <= max_b && user.max_budget >= min_b }


    # reduce by availability
    users.select! { |user| user.max_availability && user.min_availability}
    min_a = self.min_availability
    max_a = self.max_availability
    users.select! { |user| user.min_availability <= max_a && user.max_availability >= min_a }

    # return matches
    users
  end

  def min_budget
    location_preferences.pluck(:min_budget).min
  end

  def max_budget
    location_preferences.pluck(:max_budget).max
  end

  def min_availability
    availabilities.pluck(:start_date).min
  end

  def max_availability
    availabilities.pluck(:end_date).max
  end

  def similar_locations(match)
    my_locations = locations
    their_locations = match.locations

    my_locations.to_a.select! { |location| their_locations.includes(location)}
    my_locations
  end

  def similar_budget(match)
    if min_budget > match.min_budget
      min_b = min_budget
    else
      min_b = match.min_budget
    end

    if max_budget < match.max_budget
      max_b = max_budget
    else
      max_b = match.max_budget
    end

    "$#{min_b} to $#{max_b}"
  end

  def similar_availability(match)
    if min_availability > match.min_availability
      min_a = min_availability
    else
      min_a = match.min_availability
    end

    if max_availability < match.max_availability
      max_a = max_availability
    else
      max_a = match.max_availability
    end

    "#{min_a.strftime('%m/%d/%Y')} to #{max_a.strftime('%m/%d/%Y')}"
  end
end
