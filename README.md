# Train Ticket Booking System

This repository contains the implementation of an online train ticket booking system developed during the Systems Analysis and Design course. The system incorporates various use cases to manage account information, provide train timetable details, and facilitate ticket booking and management.

## Table of Contents

- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Technology Stack

The project utilizes the following technologies:

- **Frontend:** HTML, JavaScript, CSS
- **Backend:** Java
- **Web Framework:** Jakarta Servlet (Apache Tomcat)
- **Database:** MySQL
- **Database Access:** JDBC
- **Design Pattern:** MVC (Model-View-Controller)

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/colinpeng-datascience/train-ticket-system.git
    ```

2. **Set up the database using the provided SQL script:**

    ```bash
    # Example for MySQL
    mysql -u username -p < Data_Base.sql
    ```

3. **Deploy the HTML and JavaScript files in the `\train_ticket` directory to your preferred web server.**

4. **Compile and deploy the Java controllers and objects in `\train_ticket\WEB-INF\classes\ncu\im3069\demo\controller` ,  `\train_ticket\WEB-INF\classes\ncu\im3069\demo\app`, and `\train_ticket\WEB-INF\classes\ncu\im3069\demo\util` respectively.**

## Usage

1. **Access the deployed HTML files through your web browser.**

2. **Follow the provided use cases for account management, search train timetable information, train management, ticket booking, and ticket management.**

## Documentation

The `docs/` directory contains comprehensive documentation, including requirements, analysis, and design documents. These documents are written in Traditional Chinese.

## Contributing

If you would like to contribute to the project, feel free to open a PR.

## License

This project is licensed under the MIT License.

## Acknowledgements

Special thanks to Professor Hsu and the TAs for guidance during the Systems Analysis and Design course.
