module EnumerableConstant

  # default (overridable) value for any
  def self.any_value
    -1
  end

  def self.any
    [any_value, '[any]']
  end

  class Tupple

    include Comparable

    attr_accessor :name, :value, :display_name

    def initialize(name, value=nil, display_name=nil)
      @name = name
      @value = value
      @display_name = display_name
    end

    def <=> other
      self.display_name <=> other.display_name
    end

    def title_translated
      t("order_status_#{self.name.downcase}")
    end

    def title
      if @display_name
        self.display_name
      else
        self.name.titleize.strip
      end
    end

    def id
      self.value
    end

  end

  class Base

    include Comparable

    def <=>

    end

    def self.class_var_prefix
      prefix = self.name.gsub!('::', '_')
      prefix.nil? ? self.name : prefix.underscore
    end

    def self.base=(value)
      class_eval("@@#{self.class_var_prefix}_base = value")
    end

    def self.base(value)
      class_eval("@@#{self.class_var_prefix}_base = value")
    end

    def self.constant(name, value=nil, display_name=nil)
      class_eval("@@#{self.class_var_prefix}_constants ||= []")
      class_eval("@@#{self.class_var_prefix}_base ||= 0 ")
      if value == nil &&
         class_eval("@@#{self.class_var_prefix}_constants.size == 0")
        value = class_eval("@@#{self.class_var_prefix}_base")
      end
      if value == nil &&
         class_eval("@@#{self.class_var_prefix}_constants.size > 0")
        begin
          value = class_eval(
            "@@#{self.class_var_prefix}_constants.last.value.succ")
        rescue
          value = nil
        end
      end
      class_eval("#{name.to_s.underscore.upcase} = #{value}")
      class_eval("@@#{self.class_var_prefix}_constants << \
                 EnumerableConstant::Tupple.new(name, value, display_name)")
    end

    def self.constants
      class_eval("@@#{self.class_var_prefix}_constants")
    end

    def self.constant_names
      result = []
      class_eval("@@#{self.class_var_prefix}_constants").map do |tupple|
        result << tupple.name
      end
      result
    end

    def self.names
      result = []
      class_eval("@@#{self.class_var_prefix}_constants").map do |tupple|
        result << tupple.title
      end
      result
    end

    def self.values
      result = []
      class_eval("@@#{self.class_var_prefix}_constants").map do |tupple|
        result << tupple.value
      end
      result
    end

  end

  module VERSION
    MAJOR = 1
    MINOR = 0
    TINY  = 0
    STRING = [MAJOR, MINOR, TINY].join('.')
  end

end

class ActiveRecord::Base

  def self.enumerable_constant(attribute_name, options={})
    unless options[:constants]
      raise ArgumentError, "you must specify a list of constants"
    end
    set_name = attribute_name.to_s.camelize
    set_class = "#{self.name}::#{set_name}"

    constant_definitions = ""
    options[:constants].each do |constant|
      constant_definitions << "constant '#{constant.to_s.underscore.upcase}'\n"
    end

    # allow for :connector and :skip_last_comma as used in Array#to_sentence
    if options[:connector]
      connector = options[:connector]
    else
      connector = 'or'
    end
    unless options[:skip_last_comma].kind_of? NilClass
      skip_last_comma = options[:skip_last_comma]
    else
      skip_last_comma = true
    end

    if options[:base]
      use_base = options[:base]
    else
      use_base = 1
    end

    # keep glue_text for back compat
    if options[:glue_text]
      connector = options[:glue_text].strip
    end

    class_eval <<-EOF
      class #{set_name} < EnumerableConstant::Base
        base #{use_base}
        #{constant_definitions}
      end
    EOF

    should_be_in_text = set_class.constantize.names.to_sentence(
      :words_connector     => connector,
      :last_word_connector => skip_last_comma
    )

    unless options[:no_validation]
      class_eval <<-EOF
        validates_presence_of :#{attribute_name.to_s},
          :in => #{set_name}::values,
          :message => "should be #{should_be_in_text}"
      EOF
    end
  end

end
