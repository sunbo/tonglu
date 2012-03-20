require 'digest/sha1'
class User < ActiveRecord::Base
  # Virtual attribute for the unencrypted password
   has_many_friends 
  attr_accessor :password

  validates_presence_of     :login,  :message => "用户名不能为空"
  validates_presence_of     :email,  :message => "Email不能为空"
  validates_presence_of     :password,                    :message => "密码不能为空" ,           :if => :password_required?
  validates_presence_of     :password_confirmation,       :message => "确认密码不能为空",            :if => :password_required?
  validates_length_of       :password, :within => 6..20,   :too_short  => "密码最少6位",:too_long => "密码最多20位",      :if => :password_required?
  validates_confirmation_of :password,                    :message => "两次输入的密码不一致",    :if => :password_required?
  validates_length_of       :login,    :within => 2..20,   :too_short  => "用户名最少2位",:too_long => "用户名最多20位"
  validates_length_of       :email,    :within => 3..40,   :too_short  => "Email最少3位",:too_long => "Email最多20位"
  #validates_uniqueness_of   :login,  :case_sensitive => false,  :message => "用户名已存在"
  validates_uniqueness_of   :email, :case_sensitive => false,  :message => "Email已存在"
  validates_format_of       :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i,  :message => "Email格式不正确"

   has_many :permissions
   has_many :roles, :through => :permissions
   has_many :messages
   has_many :states
   has_many :mailcodes
   has_many :educations
   has_many :schools
   has_many :works
   has_many :comments
   has_many :line_users
   has_many :line_maps
   has_many :line_notes
  has_many :line_articles
  has_many :line_contents
   has_many :line_details do
     def recent
       find(:all,:order => 'created_at desc', :limit => 3)
     end
   end
   has_many :entry_comments
   has_many :entries do
     def recent
       find(:all,:order => 'created_at desc', :limit => 6)
     end
   end
   has_one :detail
   has_many :events, :dependent => :destroy, :order => 'date desc'
   
  after_create :create_details
  before_save :encrypt_password
  before_create :make_activation_code 
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation

   class ActivationCodeNotFound < StandardError; end
   class AlreadyActivated < StandardError
     attr_reader :user, :message;
     def initialize(user, message=nil)
       @message, @user = message, user
     end
   end

   # Finds the user with the corresponding activation code, activates their account and returns the user.
   #
   # Raises:
   #  +User::ActivationCodeNotFound+ if there is no user with the corresponding activation code
   #  +User::AlreadyActivated+ if the user with the corresponding activation code has already activated their account
   def self.find_and_activate!(activation_code)
     raise ArgumentError if activation_code.nil?
     user = find_by_activation_code(activation_code)
     raise ActivationCodeNotFound if !user
     raise AlreadyActivated.new(user) if user.active?
     user.send(:activate!)
     user
   end

  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

   def active?
     # the presence of an activation date means they have activated
     !activated_at.nil?
   end

   # Returns true if the user has just been activated.
   def pending?
     @activated
   end

   # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
   # Updated 2/20/08
   def self.authenticate(email, password)
     u = find :first, :conditions => ['email = ?', email] # need to get the salt
     u && u.authenticated?(password) ? u : nil
   end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  def logout_successful
    self.updated_at = Time.now
    self.status = "offline"
     save(false)
  end

  def login_successful
    self.updated_at = Time.now
    self.status = "online"
     save(false)
  end
   def forgot_password
     @forgotten_password = true
     self.make_password_reset_code
   end

   def reset_password
     # First update the password_reset_code before setting the
     # reset_password flag to avoid duplicate email notifications.
     update_attribute(:password_reset_code, nil)
     @reset_password = true
   end

    #used in user_observer
   def recently_forgot_password?
     @forgotten_password
   end

   def recently_reset_password?
     @reset_password
   end

   def self.find_for_forget(email)
     find :first, :conditions => ['email = ? and activated_at IS NOT NULL', email]
   end

   def has_role?(rolename)
     self.roles.find_by_rolename(rolename) ? true : false
   end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    def make_activation_code
      self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
  
 def make_password_reset_code
     self.password_reset_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
   end
   
 def create_details
   self.create_detail
 end
   private
   
   def activate!
     @activated = true
     self.update_attribute(:activated_at, Time.now.utc)
   end
end
