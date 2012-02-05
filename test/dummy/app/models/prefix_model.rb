class PrefixModel < ActiveRecord::Base
  randomized_field :dummy_field, :prefix => 'Q'
end
