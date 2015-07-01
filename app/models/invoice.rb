class Invoice < ActiveRecord::Base
  has_many :line_items , :dependent => :destroy
  accepts_nested_attributes_for :line_items  ,   allow_destroy: true, :reject_if => lambda { |attr| attr[:service].blank? }
  before_create :set_uuid

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end
