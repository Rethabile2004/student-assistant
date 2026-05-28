# Student Assistant

Student Assistant is a Flutter application backed by Supabase that helps students apply for student assistant positions and gives administrators a focused workflow for reviewing, approving, rejecting, and tracking those applications.

This project was built as a portfolio-ready mobile application around a real academic workflow: students submit their details, choose modules, upload required documents, and track their application status, while admins manage applications and student records from a dedicated dashboard.

## Highlights

- Student authentication with role-aware navigation
- Profile management for student details, student number, year of study, and contact information
- Guided application flow with module selection and eligibility confirmation
- Document upload support for transcripts, ID documents, and proof of registration
- Student dashboard for viewing, editing, and deleting pending applications
- Admin dashboard with application statistics, notifications, and review actions
- Admin tools for approving, rejecting, deleting applications, and managing student accounts
- Assigned-subjects view for seeing approved assistants grouped by module
- Supabase backend integration for auth, database access, storage, and notifications

## Tech Stack

- Flutter
- Dart
- Supabase Auth
- Supabase Database
- Supabase Storage
- Provider
- File Picker

## Architecture

The codebase is organized around a simple service and viewmodel structure. Supabase calls are isolated inside service classes, Provider viewmodels handle screen state, and the UI layer stays focused on forms, navigation, and user feedback.

That separation keeps the project easy to explain in interviews: the app is not just screens connected directly to a database. It has models, backend services, state management, reusable widgets, and role-based workflows.

## Screens

- Splash and authentication
- Student home dashboard
- Student profile
- Application form
- Application details
- Admin dashboard
- Admin notifications
- Student management
- Assigned subjects

## Project Structure

```text
lib/
  data/          Static module data
  models/        Application, user, and notification models
  services/      Supabase data and auth services
  viewmodels/    Provider-backed state management
  views/         Student, admin, home, and auth screens
  widgets/       Shared UI components
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- A Supabase project

### Supabase Setup

Create the following Supabase resources:

- `profiles`
- `applications`
- `application_modules`
- `admin_notifications`
- `documents` storage bucket

The app expects profile roles such as `student`, `admin`, and `disabled`.

### Expected Data Model

```text
profiles
  id
  email
  role
  first_name
  last_name
  student_number
  year_of_study
  phone

applications
  id
  student_id
  year_of_study
  confirmed_eligibility
  transcript_url
  id_document_url
  proof_of_registration_url
  status
  created_at

application_modules
  id
  application_id
  academic_level
  semester
  module_code
  module_name

admin_notifications
  id
  application_id
  student_id
  title
  message
  is_read
  created_at
```

### Run Locally

```bash
flutter pub get
flutter run --dart-define=SUPABASE_URL=your_supabase_project_url --dart-define=SUPABASE_ANON_KEY=your_supabase_anon_key
```

You can also create a local `supabase.env.json` file and run:

```bash
flutter run --dart-define-from-file=supabase.env.json
```

Example:

```json
{
  "SUPABASE_URL": "your_supabase_project_url",
  "SUPABASE_ANON_KEY": "your_supabase_anon_key"
}
```

### Analyze and Test

```bash
flutter analyze
flutter test
```

## Author

Rethabile Eric Siase  
Junior Software Developer  
[GitHub](https://github.com/Rethabile2004) | [LinkedIn](https://www.linkedin.com/in/rethabile-eric-siase-6199a131a/)
