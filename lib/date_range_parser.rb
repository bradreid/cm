module DateRangeParser

  def parse_date(range, utc = true)
    
    date_range = normalize_date_strings(range ? range.split(' - ') : [])
    from, to = nil

    if date_range.present? 
      from = Time.zone.parse(date_range.first).beginning_of_day
      to   = Time.zone.parse((date_range.size == 2) ? date_range.last : date_range.first).end_of_day
      from = from.utc if utc
      to = to.utc if utc
    else
      raise ArgumentError, 'Missing parameters.'
    end
    
    [from, to]
  end 
  module_function :parse_date

  # Switches North-American style dates ('mm/dd/yyyy') into standard dd/mm/yyyy strings
  def normalize_date_strings(date_strings, separator = '/')
    return date_strings if RUBY_VERSION < '1.9'
    date_strings = [*date_strings] # ensure Array
    date_strings.map! do |ds|
       fragments = ds.split(separator)
      [fragments[1], fragments[0], fragments[2]].join(separator)
    end
  end
  module_function :normalize_date_strings
  
end 

