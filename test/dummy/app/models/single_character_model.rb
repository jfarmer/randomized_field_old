class SingleCharacterModel < ActiveRecord::Base
  randomized_field :dummy_field, :valid_characters => ['a']
end
