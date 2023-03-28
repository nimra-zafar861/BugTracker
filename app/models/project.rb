class Project < ApplicationRecord
    
    has_many :bugs ,as: :Bugable
    has_many :project_users
    has_many :users ,through: :project_users , dependent: :destroy
    accepts_nested_attributes_for :project_users ,:allow_destroy => true
    validates :name , :description ,:presence =>true ,:uniqueness=>true

end
