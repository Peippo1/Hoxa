# Hoxa iOS App

This directory now contains a runnable SwiftUI Xcode project for the primary Hoxa experience.

## What is included

- `ios-app/Hoxa.xcodeproj` for opening in Xcode
- app shell with `TabView`
- starter sections for `Plan`, `Train`, `Progress`, and `Social`
- onboarding flow
- mock-first data service
- lightweight MVVM-style feature view models
- integration-ready protocols for future health and calendar providers
- preview-friendly structure

## How to Run

1. Open `ios-app/Hoxa.xcodeproj` in Xcode.
2. Select the `Hoxa` scheme.
3. Run on an iPhone simulator or device.

## Notes

- The project targets iOS 17+.
- `AppModel` owns app-level state such as onboarding completion and selected goal.
- feature view models keep screen-specific shaping logic out of the views
- external integrations are still placeholder protocols, so HealthKit and calendar work can be added later without changing the feature UI
- mock data remains the default so the app is usable without a backend
