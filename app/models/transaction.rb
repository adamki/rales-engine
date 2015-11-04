class Transaction < ActiveRecord::Base
  belongs_to :invoice

  scope :successful,-> {where(result: "success")}

  scope :failed, -> {where(result: "failed")}

  scope :
end
