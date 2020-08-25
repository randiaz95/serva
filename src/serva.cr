require "sqlite3"

module Serva
  VERSION = "0.1.0"

  class Engine

    def initialize(@filename : String)
      puts "Creating and connecting #{@filename}."

      if @filename == ""
        @filename = "sqlite3://data.db"
      end

      begin
        DB.open @filename do |db|
          db.exec "CREATE TABLE storage(key text, value text);"
        end
      rescue e
        puts "#{e} at #{@filename}"
      end

    end

    def [](key : String)

      begin
        DB.open @filename do |db|
          return db.scalar "SELECT value FROM storage WHERE key='#{key}' LIMIT 1;"
        end
      rescue e
        puts e
        return nil
      end

    end

    def []=(key : String, value : String)
      
      begin
        if self[key]!=nil
          puts "Updating '#{key}' to '#{value}'"
          DB.open @filename do |db|
            db.exec "UPDATE storage SET key='?', value=?;", key, value
          end
        else
          puts "Creating '#{key}' to '#{value}'"
          DB.open @filename do |db|
            db.exec "INSERT INTO storage VALUES (?, ?);", key, value
          end
        end
      rescue e
        puts e
      end

    end

  end

end

# Test connection
e = Serva::Engine.new("sqlite3://data.db")

# Print non-existing key
puts e["missing_key"]

# Try to create a new key and then get it
e["new_key"] = "new_value"
puts e["new_key"]

