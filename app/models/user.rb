class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
         #:recoverable, :rememberable, :trackable,

  has_many :collections, dependent: :destroy
  has_many :monuments, through: :collections
end
