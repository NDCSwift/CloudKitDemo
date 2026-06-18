# 📦 SwiftData + CloudKit Sync Demo

A minimal reference project demonstrating how to use **SwiftData** with **CloudKit** for seamless syncing of user data across iPhone, iPad, and Mac devices.  
This example includes a simple `Entry` model, a basic UI for creating and displaying entries, and all the core configuration needed for CloudKit-backed persistence.

---

## 🤔 What this is

This project shows how to wire SwiftData to CloudKit so your app's data automatically syncs across all of a user's devices. It uses a minimal `Entry` model to demonstrate the required setup steps — container configuration, iCloud capability, and the compatibility rules CloudKit enforces. It also documents the three most common setup errors and how to fix them.

## ✅ Why you'd use it

- **SwiftData + CloudKit together** — shows the exact `.modelContainer` configuration for cloud sync
- **Error reference guide** — covers Invalid Bundle, Bad Container, and schema mismatch (Error 134060) with fixes
- **Photo asset support** — includes `photoAssets: [Data]?` pattern for syncing image data
- **CloudKit Dashboard guidance** — explains how to inspect your `CD_Entry` record type in the developer portal
- **Cross-platform** — same model runs on iPhone, iPad, and Mac with zero extra code

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/rtlVb6aazFg)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@noahdoescoding).

---

## ✨ Features
- `@Model`-based SwiftData setup
- CloudKit-backed persistence with `.modelContainer(for:)`
- Basic UI to:
  - Add new entries (Name + Description)
  - Display saved entries
  - Sync entries across devices logged into the same iCloud account
- Example of `photoAssets: [Data]?` to handle images with CloudKit

---

## 🚀 Getting Started

### 1. Requirements
- Xcode 16+
- iOS 18+ (or macOS 15+, iPadOS 18+)
- A physical device signed into iCloud (⚠️ CloudKit does **not** sync in the Simulator)
- An active Apple Developer Account

---

### 2. Enable iCloud + CloudKit
1. In **Xcode**, select your app target → **Signing & Capabilities**.  
2. Add the **iCloud** capability.  
3. Enable **CloudKit**.  
4. Ensure the container name matches your Bundle ID exactly, e.g.:  iCloud.com.yourcompany.appname
5. Confirm the container exists in the [Apple Developer Portal](https://developer.apple.com/account/resources/identifiers/list).

⚠️ **Common Errors:**
- *Invalid Bundle ID for container* → container and bundle don't match.  
- *Bad Container* → added in Xcode but not in Developer Portal.  
- *Error 134060 (Schema mismatch)* → remove app, clean build, rerun.  

---

### 3. The Data Model
```swift
@Model
final class Entry {
 var id: UUID = UUID()
 var title: String = ""
 var details: String = ""
 var photoAssets: [Data]? // For CloudKit sync
}
```

### 4. Usage

The HomeView provides:
- TextFields for creating new entries.
- A list of all saved entries (auto-synced across devices).
- Real-time sync powered by SwiftData + CloudKit.

Run the app on two physical devices signed into the same iCloud account to see instant syncing.

Rules for CloudKit compatibility:
- ✅ All non-optional properties must have defaults.
- ❌ Do not use `@Attribute(.unique)` (causes sync crashes).

Use the CloudKit Dashboard to inspect:
- Your container
- Development Database
- Auto-generated CD_Entry record type

---

## ⚠️ Notes
- This repo does not include entitlements or a configured iCloud container. You must set these up in your own Apple Developer account to run CloudKit sync successfully.
- Schema changes:
  - ✅ Safe: Add new optional/defaulted fields
  - ❌ Unsafe: Remove or change types (requires migration)

## 📦 Requirements
- Xcode 16+
- iOS 18+ / macOS 15+

📺 [Watch the guide on YouTube](https://youtu.be/rtlVb6aazFg)
