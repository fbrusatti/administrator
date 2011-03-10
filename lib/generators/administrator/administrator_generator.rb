require 'rails/generators'
require 'rails/generators/migration'

class AdministratorGenerator < Rails::Generators::Base
   include Rails::Generators::Migration

   class_option :create_files, :desc => 'Create folders & files into the application', :type => :boolean, :default => true
   class_option :skip_migration, :desc => 'Don\'t generate migration file for model.', :type => :boolean, :default => false

   def self.source_root
     File.join(File.dirname(__FILE__), 'templates')
   end

   # Implement the required interface for Rails::Generators::Migration.
   # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
   def self.next_migration_number(dirname) #:nodoc:
     if ActiveRecord::Base.timestamped_migrations
       Time.now.utc.strftime("%Y%m%d%H%M%S")
     else
       "%.3d" % (current_migration_number(dirname) + 1)
     end
   end

   def create_migration_file
     unless options.skip_migration?
       migration_template 'migration.rb', 'db/migrate/create_administrators_table.rb'
     end
   end


   def create_files
     if options.create_files?
      copy_file "models/admin.rb", "app/models/admin.rb"
     else
       puts "Files will not be created"
      end
   end
end
