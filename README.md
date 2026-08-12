# HR Insight (Hr-insight)

A modern, comprehensive Human Resource Management mobile application built with Flutter for iOS & Android, developed by **Fourth Pyramid**.

---

## 📱 App Overview

**HR Insight** provides employees and managers with streamlined organizational tools:
- **Attendance & Geofence Clock-in**: Location-verified check-in/check-out at workplace locations.
- **Leave & Request Management**: Submit and approve leave applications, document requests, and expense claims.
- **Employee Directory & Profiles**: Secure management of employee credentials, departments, and profile photos.
- **Manager Dashboard**: Overview of workforce attendance, shifts, and pending workflow approvals.

---

## 🌐 Public Legal & App Store Compliance Pages

The following pages are hosted via **GitHub Pages** for Google Play Store and Apple App Store compliance:

- 🔒 **Privacy Policy:** [https://markfathy.github.io/Hr-insight/](https://markfathy.github.io/Hr-insight/)
- 🗑️ **Account Deletion Request:** [https://markfathy.github.io/Hr-insight/delete-account.html](https://markfathy.github.io/Hr-insight/delete-account.html)
- ✉️ **Developer Support Email:** [fourthpyramid21@gmail.com](mailto:fourthpyramid21@gmail.com)

---

## 🚀 GitHub Pages Setup Instructions

1. **Commit and push changes to GitHub:**
   ```bash
   git add .
   git commit -m "Add Privacy Policy, Account Deletion pages, and update README"
   git push origin main
   ```

2. **Enable GitHub Pages:**
   - Go to your repository settings: [https://github.com/MarkFathy/Hr-insight/settings/pages](https://github.com/MarkFathy/Hr-insight/settings/pages)
   - Under **Build and deployment**:
     - **Source**: Select `Deploy from a branch`
     - **Branch**: Select `main` and `/ (root)`
     - Click **Save**.

---

## 🛠 Tech Stack & Architecture

- **Framework**: Flutter (Dart SDK `>=3.1.1 <4.0.0`)
- **State Management**: `flutter_bloc`
- **Networking**: `dio` & `http`
- **Location Services**: `geolocator` & `flutter_map`
- **Media & Camera**: `image_picker`, `permission_handler`
- **Package Name**: `com.fourth_pyramid.hrapp`
