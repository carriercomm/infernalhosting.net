# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 8) do

# Could not dump table "dns_resources" because of following StandardError
#   Unknown type 'dns_resource_type' for column 'type'

  create_table "dns_zones", :force => true do |t|
    t.column "user_id", :integer,                     :null => false
    t.column "origin",  :string,                      :null => false
    t.column "ns",      :string,                      :null => false
    t.column "mbox",    :string,                      :null => false
    t.column "serial",  :integer, :default => 1,      :null => false
    t.column "refresh", :integer, :default => 28800,  :null => false
    t.column "retry",   :integer, :default => 7200,   :null => false
    t.column "expire",  :integer, :default => 604800, :null => false
    t.column "minimum", :integer, :default => 86400,  :null => false
    t.column "ttl",     :integer, :default => 86400,  :null => false
  end

  add_index "dns_zones", ["origin"], :name => "dns_zones_origin_key", :unique => true

  create_table "mail_aliases", :force => true do |t|
    t.column "user_id",         :integer, :null => false
    t.column "dns_resource_id", :integer, :null => false
    t.column "username",        :string,  :null => false
    t.column "destination",     :string,  :null => false
  end

  create_table "mail_users", :force => true do |t|
    t.column "user_id",         :integer,                :null => false
    t.column "dns_resource_id", :integer,                :null => false
    t.column "name",            :string,                 :null => false
    t.column "username",        :string,                 :null => false
    t.column "password",        :string,                 :null => false
    t.column "quota_bytes",     :integer,                :null => false
    t.column "spam_thrsh",      :integer, :default => 5, :null => false
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.column "name",       :string,   :null => false
    t.column "username",   :string,   :null => false
    t.column "password",   :string,   :null => false
    t.column "created_on", :datetime, :null => false
  end

  add_index "users", ["username"], :name => "users_username_key", :unique => true

  create_table "web_aliases", :force => true do |t|
    t.column "web_site_id",     :integer, :null => false
    t.column "dns_resource_id", :integer, :null => false
  end

  create_table "web_sites", :force => true do |t|
    t.column "user_id",         :integer, :null => false
    t.column "dns_resource_id", :integer, :null => false
    t.column "serveradmin",     :string,  :null => false
    t.column "quota_bytes",     :integer, :null => false
  end

end
