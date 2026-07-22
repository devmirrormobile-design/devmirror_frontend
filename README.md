# Flutter Frontend

This is the Flutter frontend application connecting to the FastAPI backend.

## Setup

1. Make sure Flutter is installed.
2. Run `flutter pub get` to install dependencies.

## Running the App

To run the app, make sure your backend is running first.

### Android Emulator
By default, the app uses `http://10.0.2.2:8000` to connect to the backend running on the host machine.
```bash
flutter run -d chrome # Or your android emulator ID
```

### iOS Simulator
By default, the app uses `http://localhost:8000` to connect to the backend.

### Physical Device
If you are running on a physical device, you need to point the app to your computer's local IP address (e.g., `192.168.1.5`). You can do this by using `--dart-define`:
```bash
flutter run --dart-define=API_URL=http://192.168.1.5:8000
```

## Testing
```bash
flutter test
```
