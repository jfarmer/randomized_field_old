require 'test_helper'

class RandomizedFieldTest < ActiveSupport::TestCase
  def setup
    @models = {
      :default_model          => DefaultModel.create,
      :prefix_model           => PrefixModel.create,
      :single_character_model => SingleCharacterModel.create
    }
  end

  def teardown
    @models.each { |(model_name, model)| model.destroy }
  end

  test "truth" do
    assert_kind_of Module, RandomizedField
    assert_kind_of Module, RandomizedField::Base
    assert_kind_of Class,  RandomizedField::Randomizer
  end

  test "DefaultModel should have the default randomized field options set" do
    model = @models[:default_model]

    field_name = model.class.randomized_field_name
    options    = model.class.randomized_field_options

    assert_equal options[:prefix], RandomizedField::DEFAULTS[:prefix]
    assert_equal options[:length], RandomizedField::DEFAULTS[:length]
    assert_equal options[:valid_characters], RandomizedField::DEFAULTS[:valid_characters]
  end

  test "The instance of DefaultModel should have the default random field values set" do
    model = @models[:default_model]

    field_name = model.class.randomized_field_name

    assert_respond_to model, field_name
    assert            model[field_name].present?
    assert_equal      model[field_name].length, RandomizedField::DEFAULTS[:length]

    assert_match      /^#{RandomizedField::DEFAULTS[:prefix]}[#{RandomizedField::DEFAULTS[:valid_characters].join("|")}]+$/,
                      model[field_name]
  end

  test "PrefixModel should have a randomized field with a prefix" do
    model = @models[:prefix_model]

    field_name = model.class.randomized_field_name
    options    = model.class.randomized_field_options

    assert_operator options[:prefix].length, :>, 0
    assert_match /^#{options[:prefix]}/, model[field_name]
    assert_equal model[field_name].length, options[:prefix].length + options[:length]
  end

  test "SingleCharacterModel should have a randomized field containing a single character" do
    model = @models[:single_character_model]

    field_name = model.class.randomized_field_name
    options    = model.class.randomized_field_options

    assert_equal options[:valid_characters].length, 1

    character = options[:valid_characters].first

    assert_equal model[field_name], character*options[:length]
  end
end
