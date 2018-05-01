class Coach < ApplicationRecord
  self.table_name = 'wp_fitpro_directory'

  scope :visible, -> { where(show_in_directory: 1) }

  def certification_level
    return 2 if level2_status == 1
    return 1 if level1_status == 1
  end

  def location
    [city, province, country].reject(&:blank?).join(', ')
  end

  def self.search(options)
    results = visible

    results = results.where('lower(country) LIKE ?', "%#{options[:country].downcase}%") if options[:country]
    results = results.where('lower(postalcode) LIKE ?', "%#{options[:postal_code].downcase}%") if options[:postal_code]
    results = results.where('lower(fullname) LIKE ?', "%#{options[:name].downcase}%") if options[:name]

    results
  end
end
