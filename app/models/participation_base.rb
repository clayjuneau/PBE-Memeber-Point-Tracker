class ParticipationBase < ApplicationRecord
    self.abstract_class = true
    connects_to database: { writing: :events }
end