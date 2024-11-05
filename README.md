# Appointment Doctor App

An efficient and user-friendly Flutter application designed for managing doctor appointments. With this app, users can easily book, reschedule, and manage appointments, view doctor profiles, and receive reminders. Perfect for clinics, hospitals, and individual practices looking to streamline appointment management.

---

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Installation](#installation)
- [Usage](#usage)
- [Architecture](#architecture)
- [Folder Structure](#folder-structure)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Features

- **Appointment Booking**: Book, cancel, or reschedule appointments with ease.
- **Doctor Profiles**: Browse detailed doctor profiles including specialization, experience, and patient ratings.
- **Notifications**: Receive reminders and alerts for upcoming appointments.
- **User Authentication**: Secure login and registration using Firebase.
- **Search & Filter**: Find doctors by specialization or location.

---

## Screenshots

| Login View                        | Appointment Booking                | Doctor Profile                    |
|-----------------------------------|------------------------------------|-----------------------------------|
|![login_view](https://github.com/user-attachments/assets/12fb163f-5cad-4faf-8748-178b27deb423)| ![login_view](https://github.com/user-attachments/assets/32956415-a7a6-4d71-941e-6ed9d316931d)| ![login_view](https://github.com/user-attachments/assets/73fd10eb-8eee-46a1-9110-e7969d665b53)|

| Login View                        | Appointment Booking                | Doctor Profile                    |
|-----------------------------------|------------------------------------|-----------------------------------|
|![login_view](https://github.com/user-attachments/assets/12fb163f-5cad-4faf-8748-178b27deb423)| ![login_view](https://github.com/user-attachments/assets/32956415-a7a6-4d71-941e-6ed9d316931d)| ![login_view](https://github.com/user-attachments/assets/73fd10eb-8eee-46a1-9110-e7969d665b53)|

| Home Screen                       | Appointment Booking                | Doctor Profile                    |
|-----------------------------------|------------------------------------|-----------------------------------|
|               (path/to/home.png)  | (path/to/booking.png)              | (path/to/doctor_profile.png)      |

---

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/youssefemadeldn/appointment-doctor-app.git
   cd appointment-doctor-app
2. **Install dependencies**:
   ```bash
   flutter pub get
3. **Set up Firebase**:
  
   Follow Firebase setup instructions and add your google-services.json or GoogleService-Info.plist files for Android and iOS.
4. **Run the app**:
   ```bash
   flutter run

---
  ## Usage
 1. Home Screen: View available doctors and services.
 2. Doctor Profile: Check each doctor’s profile with details.
 3. Booking Appointments: Schedule appointments with the chosen doctor.
 4. Manage Appointments: View upcoming appointments and modify as needed.
---
  ## Architecture
  
 This project uses Clean Architecture with the MVVM (Model-View-ViewModel) pattern to keep the code modular and maintainable. Each layer has a dedicated responsibility:
   1. Model: Defines the data structures and handles logic related to data.
   2. ViewModel: Connects the view and model, handling user inputs and updating the UI accordingly.
   3. View: Responsible for displaying the data and capturing user interactions.
---
  ## Folder Structure
  
 ![files structure](https://github.com/user-attachments/assets/f9a62bf5-aee1-4b78-a4b8-00fcbbba095d)

---

