class Status < ApplicationRecord
  self.table_name = "status"
  has_many :accounts, class_name: Account.name, foreign_key: "status_id"
end
