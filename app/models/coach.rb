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

  def self.search(params)
    results = all

    results = results.where('lower(country) LIKE ?', "%#{params[:country].downcase}%") if params[:country]
    results = results.where('lower(postalcode) LIKE ?', "%#{params[:postal_code].downcase}%") if params[:postal_code]
    results = results.where('lower(fullname) LIKE ?', "%#{params[:name].downcase}%") if params[:name]

    results
  end
end
