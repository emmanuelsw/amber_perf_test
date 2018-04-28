class Sign < Granite::ORM::Base
  adapter pg
  table_name signs


  # id : Int64 primary key is created for you
  field name : String
  field email : String
  field phone : String
  field birthdate : Time
  field sign : String
  timestamps
end
