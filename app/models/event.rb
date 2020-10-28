class Event < ParticipationBase
    has_and_belongs_to_many :customers
end
