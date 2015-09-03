class Animal < ActiveRecord::Base

  belongs_to :zoo

  validates_presence_of :zoo_id, :name, :type

end
