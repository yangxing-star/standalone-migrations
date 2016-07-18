namespace :db do
  desc "Creates a new migration file with the specified name, specified DATABASE(rake db:new_migration name=add_im_id_to_users DATABASE=kalemao)"
  task :new_migration, :name do |t, args|
    name = ENV['name']
    database = ENV['DATABASE'] || 'kalemao'

    unless name
      puts "Error: must provide name of migration to generate."
      puts "For example: rake #{t.name} name=add_field_to_form database=test"
      abort
    end

    unless database
      puts "Error: must provide database of migration to generate."
      puts "For example: rake #{t.name} name=add_field_to_form database=test"
      abort
    end

    StandaloneMigrations::Generator.custom_migration(name, database)
  end

  # desc "Creates a new migration file with the specified name"
  # task :new_migration, :name, :options do |t, args|
  #   name = args[:name] || ENV['name']
  #   options = args[:options] || ENV['options']

  #   unless name
  #     puts "Error: must provide name of migration to generate."
  #     puts "For example: rake #{t.name} name=add_field_to_form"
  #     abort
  #   end

  #   if options
  #     StandaloneMigrations::Generator.migration name, options.gsub('/', ' ')
  #   else
  #     StandaloneMigrations::Generator.migration name
  #   end
  # end
end