class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb =>
    "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :profile_pic, :content_type => 
    /\Aimage\/.*\Z/

    has_many :jobs
    has_one :client
end
