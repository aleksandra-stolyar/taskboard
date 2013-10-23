class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
	validates :name, :description, presence: true

  def sort=(ary)
    ary.each_with_index do |item, index|
      tasks.find(item).update_column(:priority, index)
    end
  end

end
