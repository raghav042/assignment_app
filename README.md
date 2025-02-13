# Flutter Assignment App

The application consists of two main screens:

* **User List Screen**: Displays a paginated list of users with their profile pictures and names. Implements infinite scrolling to load more users as the user scrolls down. Includes a search bar to filter users by name.
* **User Detail Screen**: Shows detailed information for a selected user, including profile picture, name, email, and phone number.

## Objective

Develop a simple Flutter application to demonstrate your skills in state management, API integration, and UI development.

## Features

* **User List Screen:**
    * Display a list of users with name and profile picture.
    * Infinite scrolling pagination - loads users in batches of 10.
    * Search functionality to filter users by name.
* **User Detail Screen:**
    * Display detailed user information: profile picture, name, email, and phone.
* **Navigation:**
    * Navigation from the User List Screen to the User Detail Screen.
    * Proper back navigation.
* **State Management:**
    * Implemented using **Riverpod**.
* **Architecture:**
    * Follows **Clean Code Architecture** principles to ensure separation of concerns, testability, and maintainability.
* **Networking:**
    * Utilizes the **Dio** package for making API requests to fetch user data from [https://reqres.in/api/users](https://reqres.in/api/users).
* **Pagination Handling:**
    * Implements server-side pagination using query parameters (`per_page` and `page`) as specified by the API.
* **Error Handling:**
    * Handles API failures and displays user-friendly error messages.
    * Loading indicators during API calls.
    * Handles scenarios like slow API responses, no internet connection, and empty API responses.
* **UI/UX:**
    * Clean and responsive UI design.
    * Proper spacing, typography, and responsiveness across different screen sizes and orientations.

**Bonus Features (Implemented - *if applicable, adjust accordingly*)**

* *Pull to Refresh* functionality on the User List Screen.
* Caching of user data using **Hive** to improve performance and offline access.
* Dependency Injection using **get\_it** for better code organization and testability.

## Technical Specifications

* **Flutter SDK:** [Specify Flutter Version used]
* **Dart SDK:** [Specify Dart Version used]
* **State Management:** Riverpod
* **Networking:** Dio
* **Caching (Bonus):** Hive
* **Dependency Injection (Bonus):** get\_it

## Getting Started

To run this application locally, follow these steps:

**Prerequisites:**

* Flutter SDK installed on your machine. [https://flutter.dev/docs/get-started/install](https://www.google.com/url?sa=E&source=gmail&q=https://flutter.dev/docs/get-started/install)
* Dart SDK (comes with Flutter)
* An IDE with Flutter support (VS Code, Android Studio, IntelliJ IDEA)

**Steps:**

1.  **Clone the repository:**

    ```bash
    git clone [YOUR_GITHUB_REPOSITORY_LINK]
    cd flutter_user_app
    ```

    *(Replace `[YOUR_GITHUB_REPOSITORY_LINK]` with the actual link to your repository)*

2.  **Get dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run the application:**

    ```bash
    flutter run
    ```

    Choose your target device (emulator/simulator or physical device).

## Directory Structure

The project follows a Clean Code Architecture with the following directory structure:

lib/
├── core/          # Core functionalities (DI, Error Handling, Networking, Utils)
│   ├── di/
│   ├── error_handling/
│   ├── networking/
│   └── utils/
├── data/         # Data layer (Datasources, Models, Repositories)
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/       # Domain layer (Entities, UseCases)
│   ├── entities/
│   └── usecases/
├── presentation/ # Presentation layer (Providers, Screens, Widgets)
│   ├── providers/
│   ├── screens/
│   └── widgets/
├── utils/        # Utility classes, extensions, theming
│   ├── extensions/
│   └── theme/
└── main.dart     # Entry point of the application

For a detailed breakdown of each directory and file, please refer to the project's root directory documentation (if available) or the initial project setup description.

## Error Handling Scenarios Addressed

* **Slow API Response:** Implemented loading indicators and timeouts.
* **No Internet Connection:** Displays an error message and provides a retry option.
* **Empty API Response:** Shows a user-friendly message when no users are available.
* **Search Edge Cases:** Search functionality is designed to handle special characters and spaces in the input.
* **Navigation Issues:** Back navigation is handled to prevent memory leaks and crashes.
* **UI Responsiveness:** The app is designed to be responsive across different screen sizes and orientations.
* **Data Caching Issues (if caching is implemented):**  Cache refresh mechanisms are in place to handle outdated data.

## Evaluation Criteria

This project will be evaluated based on the following criteria:

* **Code Quality & Structure (30%)**
* **Functionality & Features Implemented (30%)**
* **UI/UX Design & Responsiveness (20%)**
* **Error Handling & Performance Optimization (10%)**
* **Bonus Implementations (Caching, Tests, DI, etc.) (10%)**

## GitHub Repository

[**YOUR GITHUB REPOSITORY LINK HERE**]  *(Please replace this with the actual link to your GitHub repository)*

-----

Thank you for reviewing this project\!