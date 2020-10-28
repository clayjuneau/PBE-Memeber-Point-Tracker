class EventUser < ParticipationBase
    self.table_name = "customers"
    has_secure_password
end
