class Category
  def self.add(name)
    DATABASE.execute("INSERT INTO categories (name) VALUES ('#{name}')")
  end
end