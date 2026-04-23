require "test_helper"

class OwnerTest < ActiveSupport::TestCase

  test "valid owner" do
    owner = Owner.new(
      first_name: "Juan",
      last_name: "Perez",
      email: "test@mail.com",
      phone: "123"
    )
    assert owner.valid?
  end

  test "invalid without email" do
    owner = Owner.new(
      first_name: "Juan",
      last_name: "Perez",
      phone: "123"
    )
    assert_not owner.valid?
    assert_includes owner.errors[:email], "can't be blank"
  end

  test "email must be unique" do
    Owner.create!(
      first_name: "A",
      last_name: "B",
      email: "test@mail.com",
      phone: "123"
    )

    owner = Owner.new(
      first_name: "C",
      last_name: "D",
      email: "test@mail.com",
      phone: "456"
    )

    assert_not owner.valid?
  end

  test "invalid without first_name" do
    owner = Owner.new(
      last_name: "Perez",
      email: "test@mail.com",
      phone: "123"
    )
    assert_not owner.valid?
  end

  test "invalid without last_name" do
    owner = Owner.new(
      first_name: "Juan",
      email: "test@mail.com",
      phone: "123"
    )
    assert_not owner.valid?
  end

  test "invalid without phone" do
    owner = Owner.new(
      first_name: "Juan",
      last_name: "Perez",
      email: "test@mail.com"
    )
    assert_not owner.valid?
  end

  test "invalid email format" do
    owner = Owner.new(
      first_name: "Juan",
      last_name: "Perez",
      email: "invalid_email",
      phone: "123"
    )
    assert_not owner.valid?
  end

end