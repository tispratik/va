class Array
  def add_condition! (condition, conjunction = 'AND')
    if String === condition
      add_condition!([condition])
    elsif Hash === condition
      add_condition!([condition.keys.map { |attr| "#{attr}=?" }.join(' AND ')] + condition.values)
    elsif Array === condition
      if self.empty?
        #Example:
        #self = []
        #condition = ["(modulable_type=?)", "2009-08-22"]
        self[0] = "(#{self[0]}) #{conjunction} (#{condition.shift})" unless empty?
         (self << condition).flatten!
      else
        #Example:
        #self = ["(modulable_type=?) AND (parent_id=?) AND (status=?)","Task","2","20"]
        #condition = ["(tasks.due_date=?)", "2009-08-22"]
        self[0] = self[0] + " AND " + condition[0]
        condition.length.times do |i|
          if i != 0 #Skip the first element
            self << condition[i]     
          end
        end
      end
    else
      raise "don't know how to handle this condition type"
    end
    self
  end
  
  def to_s!
    if Array === self
      conditions_string = "["
      self.length.times do |i|
        conditions_string.concat('"' + self[i].to_s + '",')
      end
      
      conditions_string = conditions_string.first(conditions_string.length - 1)
      conditions_string = conditions_string + "]"
    elsif
      raise "Can only convert Array to_s!"
    end
  end
  
  def remove_condition!(condition, conjunction = 'AND')
    
    if String === condition
      #self = ["parent_id=? AND status=? AND modulable_type=?", "1", "21", "Task"]
      #condition = "parent_id"
      a, b, c = []
      str = ""
      a = self[0]
      a = a.to_a
      b = self - a
      str = a[0]
      
      if str.nil?
        return
      end
      
      c = str.split(" " + conjunction + " ")
      #condition = condition + "=?"
      c_index = nil
      
      c.each_index do |i| 
        if c[i].include?(condition)
          c_index = i
          break
        end
      end
      
      if c_index.nil?
        return
      end  
      
      c.delete_at(c_index)
      b.delete_at(c_index)
      
      if c.nil?
        return
      end
      
      self.clear
      str = ""
      str = c.join(" AND ")
      
      self << str.to_a + b
      self.flatten!
    elsif Hash === condition
      a = []
      a = condition.to_a.flatten
      key = ""
      key = a[0] #example :due_date
      key = key.to_s
      self.remove_condition!(key)
    end   
  end
  
  def replace_condition!(condition, conjunction = 'AND')
    self.remove_condition!(condition)
    self.add_condition!(condition)
  end
end