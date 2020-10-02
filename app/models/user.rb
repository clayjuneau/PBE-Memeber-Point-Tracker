class User < ApplicationRecord
    has_secure_password
end

module UserRole
    MEMBER = "member"
    ADMIN = "admin"
end
