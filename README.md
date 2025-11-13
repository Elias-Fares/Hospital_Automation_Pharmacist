# 💊 Hospital Automation – Pharmacy App

A Flutter-based mobile application built to assist pharmacy departments in efficiently managing their medicine inventory, prescriptions, and sales analytics.  
It enables pharmacists to handle CRUD operations on medicines and their alternatives, track batches and expiration dates, and receive notifications when stock runs low or products expire.

---

## 📱 Features

### 👤 Account Management
- Create a new account using an email address.  
- Sign in using personal credentials.  
- Manage profile information.  
- Log out securely.

### 💊 Medicine Management (CRUD)
- Add, edit, view, and delete medicines.  
- Manage details such as name, price, stock quantity, and expiration date.  
- Maintain multiple batches for the same medicine with separate expiry tracking.  

### 🔄 Alternative Medicines (CRUD)
- Add and manage substitute medicines.  
- Easily link alternatives to original medicines for recommendation purposes.

### 📷 Medicine Scanner
- Scan barcodes or QR codes to quickly identify medicines.  
- Automatically fetch medicine details from the database or API.  
- Support for adding scanned items directly into inventory or prescriptions.  

### 📈 Sales Statistics
- View daily, monthly, and yearly sales reports.  
- Analyze trends and track total sales revenue over time.  

### 🧮 Best & Least Selling Medicines
- Identify top-performing medicines based on sales data.  
- Detect slow-moving items to optimize inventory decisions.  

### 🧾 Electronic Prescription System
- Process prescriptions using a unique electronic code.  
- Each prescription code is valid for a **single dispensing only**.  
- Prevent double redemption through system validation.  

### 📊 Sold Medicines Overview
- Display detailed lists of all sold medicines including date, batch, and quantity.  
- Filter sales by date range, medicine name, or prescription code.  

### 📦 Inventory & Batch Management
- Track inventory quantities for each batch of a medicine.  
- Record batch numbers, production dates, and expiry dates.  
- Receive notifications for low stock or soon-to-expire items.  

### 🔔 Notifications
- Alerts for stock shortages.  
- Notifications for expired or soon-to-expire batches.  

---

## 🧠 Architecture

The project follows a **feature-based MVVM architecture**, ensuring clean separation between UI, business logic, and data layers.

### 🧩 State Management
Uses **Riverpod** for predictable, reactive, and type-safe state handling.

### 🌐 Networking
Uses **Dio** for RESTful API communication, with a unified `DataState<T>` layer to handle both success and failure responses gracefully.

#### ✅ Success
```dart
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data);
}
```

#### ❌ Failure
```dart
class DataFailed<T> extends DataState<T> {
  const DataFailed(ExceptionResponse error);
}
```

Centralized error handling:
- `lib/core/base_dio/exception_handler.dart`
- `lib/core/base_dio/data_state.dart`

Handles:
- No internet  
- Timeout  
- Cancelled requests  
- Certificate errors  
- Unknown issues  

---

## 🔥 Tech Stack

| Category | Technology |
|-----------|-------------|
| Framework | Flutter |
| Architecture | MVVM (Feature-based) |
| State Management | Riverpod |
| Networking | Dio |
| Backend | RESTful API |
| Cloud Services | Firebase |
| Error Handling | Custom DataState + ExceptionResponse |

---

## ⚙️ Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/hospital-automation-pharmacy-app.git
cd hospital-automation-pharmacy-app
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Firebase
Ensure Firebase is properly configured for Android and iOS.

### 4. Run the App
```bash
flutter run
```

---

## 🧩 Folder Structure (Simplified)
```
lib/
│
├── core/
│   ├── base_dio/
│   └── constants/
│
├── configuration/
│   ├── router/
│   └── res.dart
│
├── data/
│   ├── auth/
│   ├── medicines/
│   ├── prescriptions/
│   └── orders/
│
├── features/
│   ├── app/
│   ├── login/
│   ├── medicines/
│   ├── prescriptions/
│   ├── orders/
│   └── inventory/
│
└── main.dart
```

---

## 🚀 Future Improvements
- AI-powered sales forecasting.  
- Cloud-based backup and analytics dashboard.  
- Multi-language support (Arabic & English).  

---

**Developed with ❤️ using Flutter, Riverpod, and Dio**

