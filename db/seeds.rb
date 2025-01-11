require 'faker'
Internship.destroy_all
Company.destroy_all
Student.destroy_all
User.destroy_all

# Criando empresas
15.times do
  Company.create(
    name: Faker::Company.name,
    cnpj: Faker::Number.number(digits: 14).to_s.gsub(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, '\1.\2.\3/\4-\5'),
    address: Faker::Address.full_address,
    email: Faker::Internet.email(domain: 'company.com'),
    phone: Faker::PhoneNumber.phone_number_with_country_code
  )
end

# Criando estudantes
courses = [
'Biomedicina',
'Administração',
'Direito',
'Medicina',
'Arquitetura e Urbanismo',
'Psicologia',
'Ciências Contábeis',
'Sistemas de Informação',
'Educação Física',
'Farmácia',
'Análise e Desenvolvimento de Sistemas',
'Engenharia Civil',
'Engenharia de Produção',
'Enfermagem',
'Nutrição',
'Fisioterapia',
'Gastronomia',
'Odontologia',
'Radiologia'
]

def generate_student_number
  year = Time.now.year.to_s[2..3]
  semester = rand(1..2)
  random_number = rand(100000..999999)
  "#{year}#{semester}#{random_number}"
end

15.times do
  Student.create(
    student_number: generate_student_number,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birth: Faker::Date.birthday(min_age: 18, max_age: 35),
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    address: Faker::Address.full_address,
    course: courses.sample
  )
end


# Criando estágios
companies = Company.pluck(:id)
students = Student.pluck(:id)

if companies.empty? || students.empty?
  puts 'Não há empresas ou estudantes suficientes para criar estágios. Verifique os seeds das entidades relacionadas.'
  exit
end

10.times do
  Internship.create!(
    company_id: companies.sample,
    student_id: students.sample,
    salary: rand(300..2000),
    workload: [ 20, 30 ].sample,
    start_date: Faker::Date.between(from: 5.months.ago, to: Date.today),
    end_date: [ nil, Faker::Date.between(from: start_date, to: Date.today) ].sample
  )
end

 # Criando usuário
 User.create!(
  name: 'John Doe',
  email: 'john@example.com',
  password_digest: 'admin123',
  role: 1,
 )
