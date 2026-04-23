require "test_helper"

class AppointmentTest < ActiveSupport::TestCase

  def setup
    @owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "owner@mail.com",
      phone: "123"
    )

    @pet = Pet.create!(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: @owner
    )

    @vet = Vet.create!(
      first_name: "Ana",
      last_name: "Diaz",
      email: "vet@mail.com",
      specialization: "General"
    )
  end

  test "valid appointment" do
    ap = Appointment.new(
      date: Date.today,
      reason: "Checkup",
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )
    assert ap.valid?
  end

  test "invalid without date" do
    ap = Appointment.new(
      reason: "Checkup",
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )
    assert_not ap.valid?
  end

  test "invalid without reason" do
    ap = Appointment.new(
      date: Date.today,
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )
    assert_not ap.valid?
  end

  test "invalid without status" do
    ap = Appointment.new(
      date: Date.today,
      reason: "Checkup",
      pet: @pet,
      vet: @vet
    )
    assert_not ap.valid?
  end

  test "invalid without pet" do
    ap = Appointment.new(
      date: Date.today,
      reason: "Checkup",
      status: :scheduled,
      vet: @vet
    )
    assert_not ap.valid?
  end

  test "invalid without vet" do
    ap = Appointment.new(
      date: Date.today,
      reason: "Checkup",
      status: :scheduled,
      pet: @pet
    )
    assert_not ap.valid?
  end

  test "upcoming scope works" do
    future = Appointment.create!(
      date: Time.current + 1.day,
      reason: "A",
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )

    assert_includes Appointment.upcoming, future
  end

  test "past scope works" do
    past = Appointment.create!(
      date: Time.current - 1.day,
      reason: "B",
      status: :completed,
      pet: @pet,
      vet: @vet
    )

    assert_includes Appointment.past, past
  end

end