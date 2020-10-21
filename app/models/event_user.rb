class EventUser < ParticipationBase
    self.table_name = "users"
    has_secure_password
end
