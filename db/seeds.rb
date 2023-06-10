# Create courses
course1 = Course.create(name: 'Mathematics', duration: 12)
course2 = Course.create(name: 'Science', duration: 10)

# Create tutors
tutor1 = Tutor.create(name: 'John Doe', specialization: 'Algebra', course: course1)
tutor2 = Tutor.create(name: 'Jane Smith', specialization: 'Physics', course: course2)
tutor3 = Tutor.create(name: 'Mike Johnson', specialization: 'Chemistry', course: course2)

puts 'Seed data created successfully.'
