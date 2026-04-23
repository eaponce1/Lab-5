require "test_helper"

class PetTest < ActiveSupport::TestCase

  def setup
    @owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "owner@mail.com",
      phone: "123"
    )
  end

  test "valid pet" do
    pet = Pet.new(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: @owner
    )
    assert pet.valid?
  end

  test "invalid without name" do
    pet = Pet.new(
      species: "dog",
      date_of_birth: Date.today,
      weight: 10,
      owner: @owner
    )
    assert_not pet.valid?
  end

  test "invalid species" do
    pet = Pet.new(
      name: "Firulais",
      species: "dragon",
      date_of_birth: Date.today,
      weight: 10,
      owner: @owner
    )
    assert_not pet.valid?
  end

  test "invalid without date_of_birth" do
    pet = Pet.new(
      name: "Firulais",
      species: "dog",
      weight: 10,
      owner: @owner
    )
    assert_not pet.valid?
  end

  test "date of birth cannot be in the future" do
    pet = Pet.new(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.tomorrow,
      weight: 10,
      owner: @owner
    )
    assert_not pet.valid?
  end

  test "weight must be greater than 0" do
    pet = Pet.new(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.today,
      weight: 0,
      owner: @owner
    )
    assert_not pet.valid?
  end

  test "invalid without owner" do
    pet = Pet.new(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.today,
      weight: 10
    )
    assert_not pet.valid?
  end

  test "name is uppercased before save" do
    pet = Pet.create!(
      name: "firulais",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: @owner
    )

    assert_equal "FIRULAIS", pet.name
  end

end