# Vendor Dashboard

A comprehensive vendor management mobile application built with Flutter for streamlined vendor operations and analytics on iOS and Android.

## 🚀 Features

- **Vendor Management**: Complete CRUD operations for vendor profiles
- **Dashboard Analytics**: Insights and performance metrics
- **User Authentication**: Secure login and registration system
- **Product Management**: Add, edit, and manage vendor products
- **Insights & Analytics**: Visual charts and business intelligence
- **Cross-Platform**: Works on both iOS and Android
- **Modern UI**: Clean and intuitive user interface
- **Offline Support**: Local data caching capabilities
- **Search & Filter**: Advanced filtering and search functionality

## 🛠️ Tech Stack

- **Flutter** - Cross-platform mobile framework
- **Dart** - Programming language
- **Provider/Bloc** - State management
- **HTTP/Dio** - API communication
- **Shared Preferences** - Local data storage
- **Charts Flutter** - Data visualization
- **Material Design** - UI components

## 📋 Prerequisites

Before running this project, make sure you have the following installed:

- **Flutter SDK** (3.0.0 or higher)
- **Dart SDK** (2.17.0 or higher)
- **Android Studio** or **VS Code** with Flutter extensions
- **Xcode** (for iOS development on macOS)
- **Android SDK** and device/emulator
- **iOS Simulator** (for macOS users)

## 🔧 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/nsanidhya1/vendorDashboard.git
   cd vendorDashboard
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```

4. **Environment Configuration**
   
   Create a `config.dart` file in `lib/utils/` for API endpoints:
   ```dart
   class Config {
     static const String baseUrl = 'https://your-api-endpoint.com/api';
     static const String apiKey = 'your-api-key';
     static const String appName = 'Vendor Dashboard';
   }
   ```

## 🚀 Running the Application

### Development Mode

1. **Start an emulator/simulator or connect a physical device**

2. **Run the application**
   ```bash
   flutter run
   ```

3. **For specific platform**
   ```bash
   # Android
   flutter run -d android
   
   # iOS
   flutter run -d ios
   ```

### Debug Mode
```bash
flutter run --debug
```

### Release Mode
```bash
flutter run --release
```

## 📱 Building for Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 📁 Project Structure

```
vendorDashboard/
├── lib/
│   ├── models/
│   │   ├── dashboard_stats.dart
│   │   ├── product.dart
│   │   └── vendor.dart
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   ├── dashboard_provider.dart
│   │   └── product_provider.dart
│   ├── screens/
│   │   ├── auth/
│   │   │   └── login_screen.dart
│   │   ├── dashboard/
│   │   │   ├── dashboard_home.dart
│   │   │   ├── dashboard_screen.dart
│   │   │   └── insights_page.dart
│   │   └── products/
│   │       └── add_product_screen.dart
│   ├── services/
│   │   └── mock_api_service.dart
│   ├── utils/
│   │   ├── app_theme.dart
│   │   ├── constants.dart
│   │   ├── helpers.dart
│   │   └── validators.dart
│   ├── widgets/
│   │   └── loading_skeleton.dart
│   └── main.dart
├── android/
├── ios/
├── pubspec.yaml
└── README.md
```

## 📦 Dependencies

Key dependencies used in this project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  http: ^0.13.5
  shared_preferences: ^2.0.18
  charts_flutter: ^0.12.0
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
```

## 🔗 API Integration

The app communicates with a backend API through the `mock_api_service.dart` file. Update the base URL and endpoints as needed:

```dart
class ApiService {
  static const String baseUrl = 'https://your-api.com/api';
  
  // Vendor endpoints
  static const String vendors = '$baseUrl/vendors';
  static const String products = '$baseUrl/products';
  static const String dashboard = '$baseUrl/dashboard';
}
```

## 🧪 Testing

Run tests using:

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_test.dart

# Integration tests
flutter drive --target=test_driver/app.dart
```


## 🎨 Theming

The app uses a custom theme defined in `app_theme.dart`. You can customize:

- Color schemes
- Typography
- Component styles
- Dark/Light mode support

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## 👨‍💻 Author

**Sanidhya Nigam**
- GitHub: [@nsanidhya1](https://github.com/nsanidhya1)

## ⭐ Acknowledgments

- Built with Flutter framework
- Thanks to the Flutter community for excellent packages
- Inspired by modern mobile app design patterns


## 📱 Platform Support

- ✅ Android (API 21+)
- ✅ iOS (11.0+)
- 🔄 Web (Flutter Web support)
- 🔄 Desktop (Windows/macOS/Linux)

## 📞 Support

For support and questions:
1. Check existing [Issues](https://github.com/nsanidhya1/vendorDashboard/issues)
2. Create a new issue with detailed description
3. Contact the maintainer

---

Built with ❤️ using Flutter by [Sanidhya Nigam](https://github.com/nsanidhya1)
