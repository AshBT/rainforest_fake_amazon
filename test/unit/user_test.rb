require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    assert @user.valid?
  end

	test "user must have a name" do
    @user.name = nil
    refute @user.valid?
  end

  test "user must have an email" do
    @user.email = nil
    refute @user.valid?
  end	

  test "user must have a password" do
  skip
  end

  test "user cannot change the password_digest" do
    assert_raises(ActiveModel::MassAssignmentSecurity::Error) { @user.update_attributes(:password_digest => "djhackalkdjsfkhack") }
  end

  # Drop all data.

  test "cannot have two users with the same email" do
    user = FactoryGirl.create(:user, :email => "example@example.com")
    second_user = FactoryGirl.build(:user, :email => "example@example.com")
    refute second_user.save
    assert_equal ["has already been taken"], second_user.errors[:email]
  end

end
