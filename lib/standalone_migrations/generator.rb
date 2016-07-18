# these generators are backed by rails' generators
require "rails/generators"
module StandaloneMigrations
  class Generator
    def self.migration(name, options="")
      generator_params = [name] + options.split(" ")
      Rails::Generators.invoke "active_record:migration", generator_params,
        :destination_root => Rails.root
    end

    def self.custom_migration(name, database)
      migrate_path = "#{Rails.root}/db/migrate/#{database}"
      Dir.mkdir(migrate_path) unless File.directory?(migrate_path)
      file_name = "#{migrate_path}/#{Time.now.to_s(:number)}_#{name}.rb"
      File.open(file_name, 'w') do |f|
        f.puts "class #{name.camelcase} < ActiveRecord::Migration"
        f.puts '  # sql scripts'
        f.puts '  def up'
        f.puts '    execute ""'
        f.puts '  end'
        f.puts ''
        f.puts '  # rollback sql scripts'
        f.puts '  def down'
        f.puts '    execute ""'
        f.puts '  end'
        f.puts 'end'
        f.close
      end
      p "generate #{file_name}"
    end
  end
end