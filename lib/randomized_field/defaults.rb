module RandomizedField
  # The default values for randomized_field
  DEFAULTS = {
    :length           => 8,
    :valid_characters => (1..9).to_a + ('a'..'z').to_a,
    :prefix           => ''
  }
end