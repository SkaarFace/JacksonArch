class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def update?
    @user.admin
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end

