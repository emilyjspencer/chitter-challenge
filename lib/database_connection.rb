class DatabaseConnection

    def self.establish_connection(dbname) # connect to the database
      @connection = PG.connect(dbname: dbname)
    end


    def self.query(sql) # query the database 
      @connection.exec(sql)
    end
    # using a class instance variable to store the connection - the DatabaseConnection is never going to be instantiated.
     


end 