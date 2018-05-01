json.coaches @coaches do |coach|
  json.id coach.id
  json.name coach.fullname
  json.certification_level coach.certification_level
  json.tagline coach.specialty
  json.business_name coach.businessname
  json.location coach.location
  json.mobile_phone coach.mobilephone
  json.website coach.url
  json.email coach.email
end
