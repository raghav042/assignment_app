# Flutter Assignment App
<br><br>
<img src="https://github.com/raghav042/assignment_app/blob/main/screenshots/Screenshot_2025-02-14-10-13-00-380_com.example.assignment_app.jpg" width="250">
<img src="https://github.com/raghav042/assignment_app/blob/main/screenshots/Screenshot_2025-02-14-10-13-10-576_com.example.assignment_app.jpg" width="250">
<br><br>

### The application consists of two main screens:

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
