# Promobitech Coding Assignment

This is a coding assignment for Promobitech. The goal is to create a Course and Tutor management application that allows you to create courses and assign tutors to them. Each course can have multiple tutors, and each tutor can teach only one course. The application provides APIs for creating courses with tutors and listing all the courses along with their tutors.

## Installation

1. Install RVM (Ruby Version Manager) in your system.
2. Install Ruby version 3.2.2 using RVM.
3. Clone the repository to your local system and navigate to the project directory.
4. Run the following command to install the required gems:
5. Set up the database by running the following commands:
    rake db:create
    rake db:migrate
    rake db:seed

## Usage
1. Start the Rails server:
2. Use a tool like cURL or Postman to make API requests to the following endpoints:

- Create a course with tutors:

  ```
  POST /courses
  ```

  Request body example:
  ```
  {
    "course": {
      "name": "Mathematics",
      "duration": 12,
      "tutors_attributes": [
        { "name": "John Doe", "specialization": "Algebra" },
        { "name": "Jane Smith", "specialization": "Calculus" }
      ]
    }
  }
  ```

- List all courses with tutors:

  ```
  GET /courses
  ```

3. Review the API responses to verify the success of the requests.

## Testing

This application includes RSpec tests to ensure the correctness of the implemented functionality. To run the tests, use the following command:

rspec

## Contributing

Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

