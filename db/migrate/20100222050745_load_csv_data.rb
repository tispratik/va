class LoadCsvData < ActiveRecord::Migration
  def self.up
    require 'faster_csv'
    
    puts "Deleting existing Product Catalog..."    
    Pcsale.delete_all
    Pcproduct.delete_all
    Pcfeature.delete_all
    Pcplan
    PcplanPcfeature.delete_all
    Pcbooster.delete_all
    Pcaddon.delete_all
    puts "Loading Product Catalog..."
    ind = nil
    puts "1. Pcsales"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcsales.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pcsale.create!(:id	=> ind, :name	=> line[1], :description => line[2], :pcsaleable_type	=> line[3], :pcsaleable_id	=> line[4], :start_date	=> line[5], :end_date	=> line[6], :is_current	=> line[7], :minqty => line[8], :maxqty	=> line[9], :created_at => Date.today, :updated_at => Date.today)
    end
    ind = nil
    line = nil
    puts "2. Pcproducts"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcproducts.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pcproduct.create!(:id	=> ind, :url	=> line[1], :owner_id => line[2], :image	=> line[3], :db_to_read	=> line[4], :created_at => Date.today, :updated_at => Date.today)
    end
    ind = nil
    line = nil
    puts "3. Pcfeatures"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcfeatures.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pcfeature.create!(:id => ind, :name => line[1], :description => line[2], :pcproduct_saleid => line[3], :created_at => Date.today, :updated_at => Date.today)
    end
    ind = nil
    line = nil
    puts "4. Pcplans"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcplans.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pcplan.create!(:id => ind, :is_popular => line[1], :pcproduct_saleid => line[2], :rate => line[3], :created_at => Date.today, :updated_at => Date.today)
    end
    ind = nil
    puts "5. Pcplan_pcfeatures"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcplan_pcfeatures.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      PcplanPcfeature.create!(:id => ind, :pcplan_saleid => line[1], :pcfeature_id => line[2], :quantity => line[3], :is_active => line[4], :created_at => Date.today, :updated_at => Date.today)
    end
    ind = nil
    puts "6. Pcbooster"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcboosters.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pcbooster.create!(:id => ind, :pcfeature_id => line[1], :feature_units => line[2], :rate => line[3], :created_at => Date.today, :updated_at => Date.today)
    end    
    ind = nil
    puts "7. Pcaddon"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcaddons.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pcaddon.create!(:id => ind, :pcfeature_id => line[1], :rate => line[2], :created_at => Date.today, :updated_at => Date.today)
    end    
    puts "8. Pccoupon"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pccoupons.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pccoupon.create!(:id => ind, :pcproduct_saleid => line[1], :discount_percentage => line[2], :numberofmonths => line[3], :created_at => Date.today, :updated_at => Date.today)
    end    
    puts "9. Pcusage"
    FCSV.foreach( "#{RAILS_ROOT}/db/seed/csv/pcusages.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Pcusage.create!(:id => ind, :name => line[1], :pcfeature_id => line[2], :country_id => line[3], :rate => line[4], :isactive => line[5], :created_at => Date.today, :updated_at => Date.today)
    end
  end
end