puts "Creating data"

# CLEAN DB
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

# OWNERS
owner1 = Owner.create!(
  first_name: "Juan",
  last_name: "Perez",
  email: "juan@mail.com",
  phone: "123456",
  address: "Santiago"
)

owner2 = Owner.create!(
  first_name: "Maria",
  last_name: "Lopez",
  email: "maria@mail.com",
  phone: "789101",
  address: "Providencia"
)

owner3 = Owner.create!(
  first_name: "Pedro",
  last_name: "Gomez",
  email: "pedro@mail.com",
  phone: "111213",
  address: "Las Condes"
)

# PETS
pet1 = owner1.pets.create!(
  name: "Firulais",
  species: "dog",
  breed: "Labrador",
  date_of_birth: Date.new(2020,1,1),
  weight: 20
)

pet2 = owner1.pets.create!(
  name: "Michi",
  species: "cat",
  breed: "Siamese",
  date_of_birth: Date.new(2021,3,10),
  weight: 5
)

pet3 = owner2.pets.create!(
  name: "Conejo",
  species: "rabbit",
  breed: "Mini Lop",
  date_of_birth: Date.new(2022,6,15),
  weight: 2
)

pet4 = owner3.pets.create!(
  name: "Rocky",
  species: "dog",
  breed: "Bulldog",
  date_of_birth: Date.new(2019,8,20),
  weight: 25
)

pet5 = owner2.pets.create!(
  name: "Luna",
  species: "cat",
  breed: "Persian",
  date_of_birth: Date.new(2020,11,11),
  weight: 4
)

# VETS
vet1 = Vet.create!(
  first_name: "Ana",
  last_name: "Diaz",
  email: "ana@vet.com",
  specialization: "General"
)

vet2 = Vet.create!(
  first_name: "Carlos",
  last_name: "Rojas",
  email: "carlos@vet.com",
  specialization: "Surgery"
)

# APPOINTMENTS

# FUTURE
app1 = Appointment.create!(
  pet: pet1,
  vet: vet1,
  date: Time.current + 1.day,
  reason: "Checkup",
  status: :scheduled
)

app2 = Appointment.create!(
  pet: pet2,
  vet: vet2,
  date: Time.current + 2.days,
  reason: "Vaccine",
  status: :in_progress
)

# PAST
app3 = Appointment.create!(
  pet: pet3,
  vet: vet1,
  date: Time.current - 2.days,
  reason: "Control",
  status: :completed
)

app4 = Appointment.create!(
  pet: pet4,
  vet: vet2,
  date: Time.current - 1.day,
  reason: "Surgery",
  status: :cancelled
)

# FUTURE
app5 = Appointment.create!(
  pet: pet5,
  vet: vet1,
  date: Time.current + 3.days,
  reason: "Review",
  status: :scheduled
)

# TREATMENTS
app1.treatments.create!(
  name: "Treatment A",
  medication: "Med1",
  dosage: "10mg",
  notes: "OK",
  administered_at: Time.current
)

app2.treatments.create!(
  name: "Treatment B",
  medication: "Med2",
  dosage: "5mg",
  notes: "OK",
  administered_at: Time.current
)

app3.treatments.create!(
  name: "Treatment C",
  medication: "Med3",
  dosage: "2mg",
  notes: "OK",
  administered_at: Time.current
)

app4.treatments.create!(
  name: "Treatment D",
  medication: "Med4",
  dosage: "1mg",
  notes: "OK",
  administered_at: Time.current
)

app5.treatments.create!(
  name: "Treatment E",
  medication: "Med5",
  dosage: "3mg",
  notes: "OK",
  administered_at: Time.current
)

puts "Data created successfully!"