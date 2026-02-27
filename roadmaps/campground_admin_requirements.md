# Campground Admin App: Technical Architecture & Implementation Roadmap

## 1. System Overview
A modular, drag-and-drop administrative dashboard for campground management.
*   [ ] **Frontend:** React (TypeScript) with a component-based architecture.
*   [ ] **Backend:** Swift (Vapor framework) for a high-performance, type-safe API.
*   [ ] **Database:** PostgreSQL (via Fluent ORM in Swift).

## 2. Backend Implementation (Swift/Vapor)
The backend will be structured into independent modules (Services) to ensure scalability.

### Core API Services
*   [ ] **Identity Service:**
    *   [ ] JWT-based authentication (Admin, Staff, Parent roles).
    *   [ ] OAuth integration for parent logins.
*   [ ] **Camper Service:**
    *   [ ] CRUD operations for camper profiles, medical records, and dietary logs.
    *   [ ] Search and filtering engine for quick lookups.
*   [ ] **Messaging Service:**
    *   [ ] WebSocket implementation for real-time messaging between parents and staff.
    *   [ ] Push notification triggers (APNs).
*   [ ] **Scheduling Service:**
    *   [ ] Calendar logic for activity rotations and facility booking.
    *   [ ] Conflict detection for staff assignments.
*   [ ] **Payroll & HR Service:**
    *   [ ] Clock-in/out tracking for staff.
    *   [ ] Calculation logic for hourly rates, overtime, and tax deductions.
    *   [ ] Integration with payment processors (e.g., Stripe) for disbursements.

### Data Layer
*   [ ] Modular Migrations: Each service owns its database schema.
*   [ ] Fluent Models: Type-safe Swift representations of database entities.

## 3. Frontend Implementation (React/TypeScript)
The frontend focuses on a "Dashboard Builder" approach where admins can customize their workspace.

### Component Architecture (Drag-and-Drop)
*   [ ] **Widget Library:**
    *   [ ] `ScheduleWidget`: Interactive timeline of daily activities.
    *   [ ] `MessagingWidget`: Minimized chat interface for active conversations.
    *   [ ] `StaffStatusWidget`: Real-time view of which staff members are clocked in.
    *   [ ] `CamperQuickLook`: Summary card for specific camper alerts (allergies/meds).
*   [ ] **Layout Engine:**
    *   [ ] Implementation of `dnd-kit` or `react-grid-layout` to allow admins to reposition and resize widgets.
    *   [ ] Persistence layer to save individual user layout preferences to the backend.

### State Management
*   [ ] **TanStack Query (React Query):** For efficient API data fetching, caching, and synchronization.
*   [ ] **Zustand:** For lightweight global state (UI preferences, active session).

## 4. Development Milestones

### Phase 1: Foundation
*   [ ] Setup Vapor project structure with PostgreSQL.
*   [ ] Implement Identity Service and JWT auth.
*   [ ] Build the React scaffolding with basic layout and routing.

### Phase 2: Core Management
*   [ ] Build Camper and Staff CRUD APIs.
*   [ ] Implement the drag-and-drop dashboard grid in the frontend.
*   [ ] Create the first set of "Information Cards" components.

### Phase 3: Communication & Scheduling
*   [ ] Implement WebSocket-based messaging.
*   [ ] Build the complex scheduling engine (Backend logic + Frontend calendar view).
*   [ ] Integrate APNs for mobile updates.

### Phase 4: Operations & Payroll
*   [ ] Develop the Payroll service and staff time-tracking.
*   [ ] Add financial reporting and administrative analytics dashboards.
