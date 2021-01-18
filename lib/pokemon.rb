class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db

    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql,name, type)
    end

    def self.find(id,db)
        sql = <<-SQL
            SELECT * FROM pokemon 
            WHERE id = ?
        SQL
        array = db.execute(sql,id)[0]
        self.new(id:array[0],name:array[1],type:array[2],db:db)
    end

end
