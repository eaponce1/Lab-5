require "test_helper"

class VetTest < ActiveSupport::TestCase

  test "valid vet" do
    vet = Vet.new(
      first_name: "Ana",
      last_name: "Diaz",
      email: "vet@mail.com",
      specialization: "General"
    )
    assert vet.valid?
  end

  test "invalid without first_name" do
    vet = Vet.new(
      last_name: "Diaz",
      email: "vet@mail.com",
      specialization: "General"
    )
    assert_not vet.valid?
  end

  test "invalid without last_name" do
    vet = Vet.new(
      first_name: "Ana",
      email: "vet@mail.com",
      specialization: "General"
    )
    assert_not vet.valid?
  end

  test "invalid without specialization" do
    vet = Vet.new(
      first_name: "Ana",
      last_name: "Diaz",
      email: "vet@mail.com"
    )
    assert_not vet.valid?
  end

  test "invalid without email" do
    vet = Vet.new(
      first_name: "Ana",
      last_name: "Diaz",
      specialization: "General"
    )
    assert_not vet.valid?
  end

  test "invalid email format" do
    vet = Vet.new(
      first_name: "Ana",
      last_name: "Diaz",
      email: "invalid_email",
      specialization: "General"
    )
    assert_not vet.valid?
  end

  test "email must be unique" do
    Vet.create!(
      first_name: "A",
      last_name: "B",
      email: "vet@mail.com",
      specialization: "General"
    )

    vet = Vet.new(
      first_name: "C",
      last_name: "D",
      email: "vet@mail.com",
      specialization: "General"
    )

    assert_not vet.valid?
  end

end