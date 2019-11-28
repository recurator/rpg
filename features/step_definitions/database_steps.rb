Given "Clean database tables {string}" do |tables|
  tables.split(', ').each{ |table| table.constantize.delete_all }
end
