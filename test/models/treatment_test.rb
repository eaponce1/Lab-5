require "test_helper"

class TreatmentTest < ActiveSupport::TestCase

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

    @appointment = Appointment.create!(
      date: Time.current,
      reason: "Checkup",
      status: :scheduled,
      pet: @pet,
      vet: @vet
    )
  end

  test "valid treatment" do
    t = Treatment.new(
      name: "Treatment A",
      administered_at: Time.current,
      appointment: @appointment
    )
    assert t.valid?
  end

  test "invalid without name" do
    t = Treatment.new(
      administered_at: Time.current,
      appointment: @appointment
    )
    assert_not t.valid?
  end

  test "invalid without administered_at" do
    t = Treatment.new(
      name: "Treatment A",
      appointment: @appointment
    )
    assert_not t.valid?
  end

  test "invalid without appointment" do
    t = Treatment.new(
      name: "Treatment A",
      administered_at: Time.current
    )
    assert_not t.valid?
  end

end
