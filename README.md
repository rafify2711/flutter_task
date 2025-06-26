# Flutter Task

A Flutter application using GetX for state management, Firebase for backend services, and MVVM architecture.

## Features
- MVVM architecture (Model - View - ViewModel/Controller)
- State management with GetX
- User data and orders stored in Firebase Firestore
- Profile picture upload with Firebase Storage
- Reusable widgets for buttons, text fields, etc.
- Centralized constants for colors, styles, and padding

## Project Structure
```
lib/
  core/
    constants/        # Colors, styles, etc.
    widgets/          # Reusable widgets
  data/
    models/           # Data models (User, Order, etc.)
    data_sources/     # Firebase data sources
  modules/
    profile/
      views/          # UI screens
      controllers/    # GetX Controllers (ViewModels)
      bindings/       # GetX Bindings
    orders/
      views/
      controllers/
      bindings/
  routes/             # App routes and GetX pages
  main.dart           # App entry point
```

## Getting Started

1. **Clone the repository**
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Set up Firebase:**
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files.
   - Make sure Firebase is configured in your project.
4. **Run the app:**
   ```bash
   flutter run
   ```

## Useful Resources
- [GetX Documentation](https://pub.dev/packages/get)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [Flutter Documentation](https://docs.flutter.dev/)
