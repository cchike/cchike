require 'sequel'
require 'mysql'
# vagomain.db.10107937.hostedresource.com

begin
    DB = Sequel.connect(:adapter=>'mysql', :host=>'vagomain.db.10107937.hostedresource.com', :database=>'vagomain', :user=>'vagomain', :password=>'aA@8aA@8')
    p DB
    DB.fetch("SELECT * FROM order limit 1") do |row|
      p row
    end
    # puts con.get_server_info
    # rs = con.query 'SELECT VERSION()'
    # puts rs.fetch_row    

end
