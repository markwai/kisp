class Concept < ActiveRecord::Base
  has_many :briefs, as: :briefable
  belongs_to :user
end