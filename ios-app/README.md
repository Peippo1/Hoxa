# Hoxa iOS App Scaffold

This directory contains a SwiftUI-first source scaffold for the primary Hoxa experience.

## What is included

- app shell with `TabView`
- top-level sections for `Plan`, `Train`, `Progress`, and `Social`
- onboarding starter flow
- mock data service
- lightweight MVVM-style feature view models
- integration-ready protocols for health and calendar providers
- preview-friendly structure

## Suggested Xcode Setup

1. Create a new iOS App target named `Hoxa`.
2. Copy the contents of the `Hoxa/` directory into the Xcode project.
3. Set the deployment target to iOS 17 or later to use Observation cleanly.
4. Add an app icon and launch screen assets.
5. Replace the mock service with real repositories and API clients over time.

## Architecture Notes

- `AppModel` owns app-level state such as onboarding completion and selected goal.
- feature view models keep screen-specific shaping logic out of the views
- views stay small and focused
- external integrations are represented as protocols so HealthKit and calendar work can slot in later without changing feature views

## Future Work

- create a full `.xcodeproj`
- add HealthKit adapter and permission flow
- add async API client
- add design assets and app icons
