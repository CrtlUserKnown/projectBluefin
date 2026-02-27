# Backend Development Roadmap (Swift/Vapor)

This roadmap outlines the tasks for the backend developer, focusing on building a robust and scalable Swift/Vapor API.

## 1. Foundation
*   [x] Initialize new Vapor project.
*   [x] Configure PostgreSQL database connection.
*   [ ] Implement basic Vapor logging and error handling.
*   [ ] Set up Docker for local development (PostgreSQL, Vapor app).

## 2. Core API Services

### 2.1 Identity Service
*   [ ] Design database schema for Users (Admin, Staff, Parent roles), Roles, and Sessions.
*   [ ] Implement user registration and login endpoints.
*   [ ] Implement JWT generation and validation for authentication.
*   [ ] Develop authorization middleware based on user roles.
*   [ ] Implement OAuth integration for parent authentication (e.g., Google, Apple).

### 2.2 Camper Service
*   [ ] Design database schemas for Campers, Medical Records, Dietary Restrictions, and Emergency Contacts.
*   [ ] Implement CRUD endpoints for managing camper profiles.
*   [ ] Implement CRUD endpoints for medical and dietary information linked to campers.
*   [ ] Develop API for searching and filtering campers based on various criteria.

### 2.3 Messaging Service
*   [ ] Design database schema for Messages, Conversations, and Recipients.
*   [ ] Implement WebSocket server for real-time bidirectional communication.
*   [ ] Develop API endpoints for sending and retrieving messages.
*   [ ] Integrate with APNs (Apple Push Notification Service) for push notifications.

### 2.4 Scheduling Service
*   [ ] Design database schemas for Activities, Schedules, Staff Assignments, and Facility Bookings.
*   [ ] Implement CRUD APIs for activities and schedules.
*   [ ] Develop logic for staff assignment to activities, including conflict detection.
*   [ ] Create APIs for booking and managing camp facilities.

### 2.5 Payroll & HR Service
*   [ ] Design database schemas for Staff, Time Entries (clock-in/out), Pay Periods, and Payroll Records.
*   [ ] Implement APIs for staff clock-in/out.
*   [ ] Develop payroll calculation logic (hourly rates, overtime, deductions).
*   [ ] Integrate with a payment processor (e.g., Stripe API) for staff payouts.
*   [ ] Implement reporting APIs for payroll summaries.

## 3. Data Layer
*   [ ] Define Fluent models for all database entities.
*   [ ] Implement database migrations for all service schemas.
*   [ ] Seed initial data for roles, admin user, etc.

## 4. API Documentation
*   [ ] Generate OpenAPI/Swagger documentation for all API endpoints.
*   [ ] Ensure API responses are consistent and well-structured.

## 5. Testing & Deployment
*   [ ] Write unit and integration tests for all API services.
*   [ ] Set up CI/CD pipeline for automated testing and deployment.
*   [ ] Configure production environment (e.g., Heroku, AWS ECS).
