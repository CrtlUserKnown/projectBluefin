# Project Bluefin

Project Bluefin is an open-source management system designed for organizations like campgrounds, schools, and camps. While it is currently focused on the specific needs of campground management, its modular architecture is designed to scale for other organizational types.

## Tech Stack

- **Backend:** Swift 6.0, Vapor 4, Fluent (Postgres)
- **Frontend:** Vue Native (Cross-platform mobile)
- **Infrastructure:** Docker, Docker Compose
- **Documentation:** OpenAPI/Swagger

## Roadmap

Project Bluefin is currently in its initial foundation phase. The full development plan can be found in the [roadmaps/](./roadmaps/) directory.

### Backend Roadmap
1.  **Foundation:** Logging, error handling, and Docker environment setup.
2.  **Core API Services:**
    - **Identity:** User management, roles, and authentication.
    - **Camper:** Profile management, medical records, and search.
    - **Messaging:** Real-time communication and push notifications.
    - **Scheduling:** Activity scheduling and staff assignments.
    - **Payroll & HR:** Time tracking and payroll integration.
3.  **Data Layer:** Schema migrations and initial data seeding.
4.  **Documentation:** Comprehensive API documentation.
5.  **Testing & Deployment:** Automated testing and CI/CD.

### Frontend Roadmap
1.  **Foundation:** Initializing the Vue Native project and setting up basic navigation.
2.  **Core Dashboard & Components:**
    - **Authentication:** Login/Logout UI and OAuth integration.
    - **Mobile Dashboard:** Responsive layout for mobile devices.
    - **Messaging:** Real-time chat interface (WebSockets).
    - **Attendance:** Camper check-in/out and staff clock-in/out.
3.  **Data Management:** State management and API integration.
4.  **Testing & Deployment:** Unit and integration tests, and mobile app deployment.

## Getting Started

Refer to the [backend/](./backend/) directory for instructions on setting up the Swift/Vapor API.
