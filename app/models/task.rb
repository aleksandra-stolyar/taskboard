class Task < ActiveRecord::Base
  belongs_to :project

  validates :name, :deadline, presence: true

  def deadline=(v)
  	self[:deadline] = Date.strptime(v, '%m/%d/%Y')
  end
end
