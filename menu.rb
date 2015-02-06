class Menu
  def self.launch
    loop do
      puts "What do you want to do?", "1. Add", "2. Delete", "3. Fetch", "4. Edit"
      @action = gets.chomp.to_i
      break if [1,2,3,4].include? @action
    end
  
    @action_text = "Add" if @action == 1
    @action_text = "Delete" if @action == 2
    @action_text = "Fetch" if @action == 3
    @action_text = "Edit" if @action == 4

    loop do
      puts "#{@action_text}...", "1. Product", "2. Category", "3. Location"
      @pcl = gets.chomp.to_i
      break if [1,2,3].include? @pcl
    end
    
    @pcl_text = "Product" if @pcl == 1
    @pcl_text = "Category" if @pcl == 2
    @pcl_text = "Location" if @pcl == 3
    
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
      end
      
      if @pcl == 2
        puts "Enter category name: "
        cat_name = gets.chomp        
      end
      
      if @pcl == 3
        puts "Enter location name: "
        loc_name = gets.chomp  
      end
    end
    
    if @action == 2
      if @pcl == 1
        id, name = action_by
        if id
          Product.delete(id)  
        else
          Product.delete(name)
        end      
      end
      
      if @pcl == 2
        id, name = action_by 
      end
      
      if @pcl == 3
        id, name = action_by 
      end
    end
    
    if @action == 3
      if @pcl == 1
        id, name = action_by 
      end
      
      if @pcl == 2
        id, name = action_by 
      end
      
      if @pcl == 3
        id, name = action_by 
      end
    end
    
    if @action == 4
      if @pcl == 1
        id, name = action_by 
      end
      
      if @pcl == 2
        id, name = action_by 
      end
      
      if @pcl == 3
        id, name = action_by 
      end
    end      
  end
  
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
end
  
  

  