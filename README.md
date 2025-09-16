# Flutter Dark Mode Clean Architecture





https://github.com/user-attachments/assets/370b7061-cf78-47c4-b882-64ea2e364c9a





A comprehensive Flutter application demonstrating modern architectural patterns and design principles through a dark mode theme persistence feature. This project serves as a practical example of how to structure Flutter applications using industry-standard patterns.

## 🏗️ **Architectural Patterns Showcased**

### **Clean Architecture**
- **Domain Layer**: Pure business logic with entities and repository interfaces
- **Data Layer**: Concrete implementations of repositories and data sources
- **Presentation Layer**: UI components, ViewModels, and state management
- **Dependency Inversion**: High-level modules don't depend on low-level modules

### **MVVM (Model-View-ViewModel)**
- **Model**: `ThemeEntity` and repository abstractions
- **View**: `ThemeScreen` widget with reactive UI updates
- **ViewModel**: `ThemeVM` managing business logic and state

### **Command Pattern**
- **Command State Management**: `CommandState<T>` with sealed classes (Idle, Executing, Succeeded, Failed)
- **Async Operation Handling**: Commands for theme loading and saving operations
- **State Tracking**: Real-time command execution state with `ValueNotifier`

### **Result Pattern**
- **Type-Safe Error Handling**: `Result<T>` with `Ok<T>` and `Error<T>` variants
- **Functional Error Management**: Using `when()` method for pattern matching
- **No Exception Throwing**: Graceful error handling without exceptions

### **Repository Pattern**
- **Abstraction Layer**: `ThemeRepo` interface defining contract
- **Implementation**: `ThemeRepoImpl` with concrete storage logic
- **Dependency Injection**: Repository injected into ViewModels

### **Provider Pattern**
- **State Management**: Using Provider package for dependency injection
- **Lazy Initialization**: Dependencies created only when needed
- **Service Locator**: `AppDependencies` managing application-wide dependencies

### **Key-Value Storage Abstraction**
- **Interface Segregation**: `KeyValueStore` abstract interface
- **Concrete Implementation**: `KeyValueStoreImpl` using SharedPreferences
- **Testability**: Easy mocking for unit tests

## 🎨 **Features**

- **Dark Mode Toggle**: Switch between light and dark themes
- **Persistent Storage**: Theme preference saved across app restarts
- **Loading States**: Visual feedback during async operations
- **Error Handling**: Graceful error management with user feedback
- **Reactive UI**: Real-time UI updates based on state changes

## 🛠️ **Technologies & Dependencies**

- **Flutter**: Cross-platform UI framework
- **Provider**: State management and dependency injection
- **Freezed**: Code generation for immutable classes and pattern matching
- **SharedPreferences**: Local key-value storage
- **Mockito**: Testing and mocking framework

## 📁 **Project Structure**

```
lib/
├── core/
│   ├── app_config.dart          # Application configuration
│   ├── app_dependencies.dart    # Dependency injection container
│   ├── storage/                 # Storage abstraction layer
│   │   ├── key_value_store.dart
│   │   └── key_value_store_impl.dart
│   ├── utils/                   # Command and Result patterns
│   │   ├── command.dart
│   │   └── result.dart
│   └── widgets/                 # Reusable UI components
│       ├── app_error_bottom_sheet.dart
│       └── app_loading_wrapper.dart
└── features/
    └── theme/                   # Feature-based organization
        ├── data/                # Data layer implementations
        │   └── repos/
        │       └── theme_repo_impl.dart
        ├── domain/              # Business logic and entities
        │   ├── entities/
        │   │   └── theme_entity.dart
        │   └── repos/
        │       └── theme_repo.dart
        └── presentation/        # UI and ViewModels
            ├── theme_vm.dart
            └── widgets/
                └── theme_screen.dart
```

## 🧪 **Testing Strategy**

- **Unit Tests**: Repository and ViewModel testing with mocks
- **Widget Tests**: UI component testing
- **Mock Dependencies**: Easy dependency replacement for testing

## 🚀 **Getting Started**

1. **Clone the repository**
   ```bash
   git clone https://github.com/tomasbaran/flutter-dark-mode-clean-architecture.git
   cd flutter-dark-mode-clean-architecture
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

4. **Toggle dark mode** and observe the architectural patterns in action

## 📚 **Learning Objectives**

This project demonstrates:
- How to structure Flutter apps with Clean Architecture
- Implementing robust error handling with Result pattern
- Managing async operations with Command pattern
- Using Provider for dependency injection and state management
- Creating testable and maintainable code architecture
- Building reactive UIs with proper state management

Perfect for developers learning Flutter architecture patterns, state management, and modern app development practices.

## 🔧 **Development**

### **Code Generation**
Run the following command to generate code for Freezed classes:
```bash
flutter packages pub run build_runner build
```

### **Testing**
Run tests with:
```bash
flutter test
```

## 📄 **License**

This project is open source and available under the [MIT License](LICENSE).

## 🤝 **Contributing**

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/tomasbaran/flutter-dark-mode-clean-architecture/issues).

## ⭐ **Show Your Support**

Give a ⭐️ if this project helped you!

---

**Happy Coding!** 🚀
