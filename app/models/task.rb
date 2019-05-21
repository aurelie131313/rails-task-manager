class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: {
    message: "You must give a title"
  }
end
