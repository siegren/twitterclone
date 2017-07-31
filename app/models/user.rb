class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    attr_accessor :login
    
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :authentication_keys => {email: true, login: false}
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
         
         has_many :tweets, dependent: :destroy
         
         has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "30x30>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  

end
