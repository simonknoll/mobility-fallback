class Contribution < ApplicationRecord
  include Mobility
  translates :landing_page, type: :string
end
