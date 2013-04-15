Ransack.configure do |config|
  config.add_predicate 'd_gteq', 
                       :arel_predicate => 'gteq',
                       :formatter => proc {|v| v.to_date.strftime },
                       :type => :string
  
  config.add_predicate 'd_lteq', 
                       :arel_predicate => 'lteq',
                       :formatter => proc {|v| v.to_date.strftime },
                       :type => :string


  config.add_predicate 'dt_gteq', 
                       :arel_predicate => 'gteq',
                       :formatter => proc {|v| "#{v.to_date.strftime} 00:00" },
                       :type => :string

  config.add_predicate 'dt_lteq', 
                       :arel_predicate => 'lteq',
                       :formatter => proc {|v| "#{v.to_date.strftime} 23:59" },
                       :type => :string
end