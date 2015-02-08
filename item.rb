class Item
  attr_accessor :item_name, :item_cat, :item_loc, :item_quant, :item_price, :item_desc
  
  def initialize(item_name,item_cat,item_loc,item_quant,item_price,item_desc)
    @item_name = item_name
    @item_cat = item_cat
    @item_loc = item_loc
    @item_quant = item_quant
    @item_price = item_price
    @item_desc = item_desc
  end
  
  def insert
    attributes = []
    instance_variables.each { |i|
      attributes << i.to_s.delete("@")
    }
    
    query_components_array = []
    attributes.each { |x|
      value = self.send(x)
      
      if value.is_a?(Integer)
        query_components_array << "#{value}"
      else
        query_components_array << "'#{value}'"
      end
    }
    
    query_string = query_components_array.join(", ")
    puts query_string
    
    DATABASE.execute("INSERT INTO items (name, category, location, quantity, cost, description) VALUES (#{query_string})")  
    
    puts "Inserted successfully!"  
  end
end