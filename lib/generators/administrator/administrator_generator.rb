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
        # create the model file
        copy_file "models/admin.rb", "app/models/admin.rb"

        # create controller files
        copy_file "controllers/administrator/admin_controller.rb", "app/controllers/administrator/admin_controller.rb"
        copy_file "controllers/administrator/admins_controller.rb", "app/controllers/administrator/admins_controller.rb"
        copy_file "controllers/administrator/application_controller.rb", "app/controllers/administrator/application_controller.rb"
        copy_file "controllers/administrator/sessions_controller.rb", "app/controllers/administrator/sessions_controller.rb"

        # create view files
        %w[index show new edit _form].each do |view|
          copy_file "views/administrator/admins/#{view}.html.haml", "app/views/administrator/admins/#{view}.html.haml"
        end
        copy_file "views/administrator/admin/index.html.haml", "app/views/administrator/admin/index.html.haml"
        copy_file "views/administrator/sessions/new.html.haml", "app/views/administrator/sessions/new.html.haml"

        # create view files
        copy_file "views/layouts/administrator/admin.html.haml", "app/views/layouts/administrator/admin.html.haml"
      end
   end
end
