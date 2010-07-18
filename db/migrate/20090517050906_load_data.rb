class LoadData < ActiveRecord::Migration
  def self.up
    #Import the data into decodes table from the file ${RAILS_ROOT}/db/seed/always/decodes.yml
    Rake::Task['db:always'].invoke
  end
end
