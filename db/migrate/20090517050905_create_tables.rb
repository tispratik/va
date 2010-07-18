class CreateTables < ActiveRecord::Migration

#USER

  def self.up
    create_table :users do |t| # user login data
      t.string :username
      t.string :login_email
      t.boolean :is_email_verified
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token
      t.string :perishable_token
      t.string :last_login_ip
      t.date :last_login_at     
      t.timestamps
    end
    
    create_table :user_local do |t| # extra user login data
      t.references :user
      t.integer :billcycle #note 29,30,31 are invalid values
      t.integer :balance #total payable balance
    end
  
#PRODUCT CATALOG

    create_table :pcsales do |t|
      t.string :name
      t.string :description
      t.references :pcsaleable, :polymorphic => true
      t.date :start_date
      t.date :end_date    
      t.boolean :is_current
      t.integer :minqty
      t.integer :maxqty
      t.timestamps
    end

    create_table :pcproducts do |t| #pcsaleable
      t.string :url
      t.string :owner_id
      t.string :image
      t.string :db_to_read
      t.timestamps
    end
    
    create_table :pcfeatures do |t| 
      t.string :name
      t.string :description
      t.integer :pcproduct_saleid #connect to pcproduct through saleid
      t.timestamps
    end
    
    create_table :pcplans do |t| #pcsaleable
      t.boolean :is_popular
      t.integer :pcproduct_saleid #connect to pcproduct through saleid
      t.integer :rate
      t.timestamps
    end
    
    create_table :pcplan_pcfeatures do |t|
      t.integer :pcplan_saleid 
      t.references :pcfeature
      t.integer :quantity
      t.boolean :is_active
      t.timestamps
    end
    
    create_table :pcboosters do |t| #pcsaleable
      t.references :pcfeature
      t.integer :feature_units
      t.integer :rate
      t.timestamps
    end
    
    create_table :pcaddons do |t| #pcsaleable
      t.references :pcfeature
      t.integer :rate
      t.timestamps
    end
    
    create_table :pcusages do |t| 
      t.string :name
      t.references :pcfeature
      t.references :country
      t.integer :rate
      t.boolean :isactive
      t.timestamps
    end

    create_table :pccoupons do |t| #pcsaleable
      t.integer :pcproduct_saleid #connect to pcproduct through saleid
      t.integer :discount_percentage
      t.integer :numberofmonths        
      t.timestamps
    end

#SUBSCRIBER

    create_table :omsaccounts do |t| 
      t.references :user
      t.integer :pcproduct_saleid #connect to pcproduct through saleid
      t.string :status
      t.date :start_date
      t.date :end_date     
      t.timestamps
    end  
       
    create_table :omsitems do |t| 
      t.references :omsaccount
      t.references :pcsales
      t.string :entity_type #PcPlan, PcBooster, PcCoupon, PcAddon
      t.date :start_date
      t.date :end_date
      t.timestamps
    end

#BILLING

    create_table :bill do |t| #corresponds to user's bill
      t.references :user
      t.integer :grand_total
      t.integer :previous_balance
      t.integer :current_balance
      t.integer :current_discount
      t.date :period_start
      t.date :period_end
      t.date :due_date
      t.integer :notifications_sent
      t.boolean :is_bill_ready
      t.timestamps
    end
   
    create_table :billcharges do |t| #holds all charges
      t.references :bill
      t.references :omsaccount
      t.references :omsitem
      t.string :description
      t.integer :quantity
      t.integer :amount
      t.timestamps
    end
    
    create_table :billpayments do |t| #holds all payments made
      t.references :user
      t.float :amount
      t.string :source
      t.timestamps 
    end    

    create_table :billnotifications do |t| #holds all payments made
      t.references :user
      t.string :description
      t.timestamps 
    end    

  end
end