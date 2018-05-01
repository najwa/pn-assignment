class Coach < ApplicationRecord
  self.table_name = 'wp_fitpro_directory'

  alias_attribute :name, :fullname
  alias_attribute :tagline, :specialty
  alias_attribute :website, :url

  def certification_level
    return 2 if level2_status == 1
    return 1 if level1_status == 1
  end

  def location
    [city, province, country].reject(&:empty?).join(', ')
  end

  def as_json(options={})
    super(only: [:id, :name, :certification_level, :tagline, :businessname, :location, :mobilephone, :website, :email],
          methods: [:name, :certification_level, :tagline, :location, :website])
  end
end
