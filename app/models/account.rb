class Account < ApplicationRecord
  belongs_to :role, class_name: Role.name, foreign_key: "role_id"
  belongs_to :status, class_name: Status.name, foreign_key: "status_id"
end
