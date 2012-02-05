module RandomizedField
  class Randomizer
    def initialize(field_name, options = {})
      @field_name = field_name
      @options    = options

      @options.each do |key, default_value|
        self.instance_variable_set "@#{key}", @options.fetch(key) { default_value }
      end
    end

    def before_create(record)
      record.send("#{@field_name}=", self.new_field_value(record))
    end

    protected
    def generate_field_value
      @prefix + (1..@length).inject("") { |str, idx| str += @valid_characters[rand(@valid_characters.size)].to_s }
    end

    def new_field_value(record)
      old_record = true
      until old_record.nil?
        random = self.generate_field_value
        old_record = record.class.where(@field_name => random).first
      end

      random
    end
  end
end
