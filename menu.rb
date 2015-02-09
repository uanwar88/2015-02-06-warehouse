class Menu
  
  # Public: Menu.launch
  # Description: Launches the CLI menu
  # Returns: nothing specific
  
  def self.launch
    puts "Welcome to the grocery store manager!"
    loop do
      puts "What do you want to do?", "1. Add", "2. Delete", "3. Fetch", "4. Edit"
      @action = gets.chomp.to_i
      break if [1,2,3,4].include? @action
    end
    
    action_items = ["Add", "Delete", "Fetch", "Edit"]
    @action_text = action_items[@action-1]
    
    # @action_text = "Add" if @action == 1
    # @action_text = "Delete" if @action == 2
    # @action_text = "Fetch" if @action == 3
    # @action_text = "Edit" if @action == 4

    if @action == 3
      loop do
        puts "#{@action_text} by...", "1. Product ID", "2. Product name", "3. Category", "4. Location"
        @fetch = gets.chomp.to_i
        break if [1,2,3,4].include? @fetch
      end
    elsif @action == 4
      @pcl_text = "Product"
    else
      loop do
        puts "#{@action_text}...", "1. Product", "2. Category", "3. Location"
        @pcl = gets.chomp.to_i
        break if [1,2,3].include? @pcl
      end
      
      pcl_items = ["Product", "Category", "Location"]
      @pcl_text = pcl_items[@pcl-1]
    end
    
    if @action == 1 
      if @pcl == 1
        puts "Enter item name:"
        item_name = gets.chomp
        puts "Enter item category:"
        item_cat = gets.chomp
        puts "Enter item location: "
        item_loc = gets.chomp
        puts "Enter product quantity: "
        item_quant = gets.chomp.to_i
        puts "Enter price: "
        item_price = gets.chomp.to_f
        puts "Enter item description: "
        item_desc = gets.chomp
        
        #add item to database
        new_item = Item.new(item_name,item_cat,item_loc,item_quant,item_price,item_desc)
        new_item.insert
      end
      
      if @pcl == 2
        puts "Enter category name: "
        cat_name = gets.chomp
        
        Category.add(cat_name)
        
        puts "Category added successfully!"      
      end
      
      if @pcl == 3
        puts "Enter location name: "
        loc_name = gets.chomp  
        
        Location.add(loc_name)
        
        puts "Location added successfully!"
      end
    end
    
    if @action == 2
      if @pcl == 1
        puts "List of items:", Item.list_items
        
        id, name = action_by

        Menu.delete(Item,id=nil,name=nil)
      end
      
      if @pcl == 2
        puts "List of categories:", Category.list_cats
        id, name = action_by 
        
        Menu.delete(Category,id=nil,name=nil)
          
      end
      
      if @pcl == 3
        puts "List of locations:", Location.list_locations
        id, name = action_by 
        Menu.delete(Location,id=nil,name=nil)
      end
    end
    
    if @action == 3
      if @fetch == 1
        puts "Enter product ID:" 
        id = gets.chomp.to_i
        
        puts Item.fetch_item_by(id,1)
      end
      
      if @fetch == 2
        puts "Enter product name:"
        name = gets.chomp
        
        puts Item.fetch_item_by(name,2)
      end
      
      if @fetch == 3
        puts "Enter category:"
        cat = gets.chomp
        puts Item.fetch_item_by(cat,3)
      end
      
      if @fetch == 4
        puts "Enter location:"
        loc = gets.chomp
        puts Item.fetch_item_by(loc,3)
      end
    end
    
    if @action == 4
      id, name = action_by
    
      if id
        puts Item.fetch_item_by(id,1)
      else
        puts Item.fetch_item_by(name,2)
      end
      
      puts "Enter item name:"
      item_name = gets.chomp
      puts "Enter item category:"
      item_cat = gets.chomp
      puts "Enter item location: "
      item_loc = gets.chomp
      puts "Enter product quantity: "
      item_quant = gets.chomp.to_i
      puts "Enter price: "
      item_price = gets.chomp.to_f
      puts "Enter item description: "
      item_desc = gets.chomp
    
      #edit item in database
      if id
        Item.edit(item_name,item_cat,item_loc,item_quant,item_price,item_desc,id)
        puts "Item edited successfully!"
      else
        Item.edit(item_name,item_cat,item_loc,item_quant,item_price,item_desc,name)
        puts "Item edited successfully!"
      end        
    end      
  end
  
  # Public: .action_by
  # Description: Used to get product, category, or location ID or name
  # Returns: id, name as integer or string
  
  def self.action_by
    puts "#{@action_text} #{@pcl_text} by...", "1. ID", "2. Name"
    by = gets.chomp.to_i
    if by == 1
      puts "Enter #{@pcl_text} ID: "
      id = gets.chomp.to_i
    else
      puts "Enter #{@pcl_text} name: "
      name = gets.chomp
    end
    return id, name    
  end
  
  # Public: Used
  def self.delete(pcl,id,name)
    if id
      pcl.delete(id) 
      puts "#{pcl.name} deleted successfully!" 
    else
      pcl.delete(name)
      puts "#{pcl.name} deleted successfully!"
    end  
  end
    
end
  
  

  