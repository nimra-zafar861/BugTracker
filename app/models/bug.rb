class Bug < ApplicationRecord
  belongs_to :user
  belongs_to :project
 validates :title ,:uniqueness=> true
enum typeOf: %i[feature bug]
  enum status_is: %i[New started completed resolved]
end
