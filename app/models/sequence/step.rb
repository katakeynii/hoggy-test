class Sequence::Step < ApplicationRecord
  belongs_to :sequence_definition, class_name: "Sequence::Definition"
  validates_numericality_of :wait, greater_than_or_equal_to: 0, message: "is not a valid number"

  before_create :check_name 


  def check_name
    self.name = "After #{self.wait} day(s)" if self.name.nil? || self.name.blank?
  end
end
