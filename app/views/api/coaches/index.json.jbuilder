json.coaches @coaches do |coach|
  decorated_coach = DecoratedCoach.new(coach)

  json.id                  decorated_coach.id

  json.name                decorated_coach.fullname
  json.certification_level decorated_coach.certification_level
  json.tagline             decorated_coach.specialty
  json.business_name       decorated_coach.businessname

  json.location do
    json.address1          decorated_coach.address1
    json.address2          decorated_coach.address2
    json.city              decorated_coach.city
    json.province          decorated_coach.province
    json.postal_code       decorated_coach.postalcode
    json.country           decorated_coach.country
  end

  json.mobile_phone        decorated_coach.mobilephone
  json.website             decorated_coach.url
  json.email               decorated_coach.email
end
