# FlutterKart

FlutterKart is a shopping application built with Flutter using **MVC architecture** and **Provider** for state management.  
It integrates with REST APIs to display products, handle user authentication (register, login, OTP verification), and navigate between multiple sections of the app.

---

## 📦 Tech Stack & Architecture

- **Framework:** Flutter 3.27.0  
- **Language:** Dart 3.6.0  
- **Architecture:** MVC (Model–View–Controller)  
- **State Management:** Provider  
- **API Integration:** REST APIs (GET/POST)  
- **UI Design:** Flutter widgets with Material Design components

---

## 📱 Screens Implemented

1. **Splash View** – Initial loading screen.  
2. **Welcome View** – App introduction.  
3. **Login View** – User login (email/phone or OTP-based login entry).  
4. **OTP View** – OTP verification for authentication.  
5. **Register View** – User registration form.  
6. **Home View** – Displays products and shop data from APIs.  
7. **Bottom Navigation View** – Navigation between app sections.  
8. **Dummy View Screen** – Shows “No Data” placeholder for unimplemented sections.

---

## 📦 Dependencies

```yaml
provider: ^6.1.5
http: ^1.4.0
flutter_staggered_animations: ^1.1.1
connectivity_wrapper: ^1.2.8
shimmer_animation: ^2.2.2
shared_preferences: ^2.5.3
lottie: ^3.3.1
carousel_slider: ^5.0.0
smooth_page_indicator: ^1.2.1

---
 ## 📦 APIs Used
APIs Used
Authentication APIs
Register User
POST https://app.ecominnerix.com/api/register

Login (Direct)
POST https://app.ecominnerix.com/api/login

OTP-based Login (2-step)

Request OTP
POST https://app.ecominnerix.com/api/request-otp

Verify OTP
POST https://app.ecominnerix.com/api/verify-email-otp

Product & Home APIs
Home Data API
GET https://app.ecominnerix.com/api/v1/home

Product Listing API
GET https://app.ecominnerix.com/api/products?shop_id=1&page_size=100&page=1



 ## 📦 Known Issues / Limitations 
Null image values:
Some API responses return null for the product image field. In such cases, a default placeholder image is displayed.

Duplicate product names:
API data sometimes contains multiple products with identical names, which may affect the product list display.

Inconsistent:
API success flags:** Some API responses do not return a proper `success` field (e.g., `success = true/false`) or a consistent success message. Instead, they return partial data or messages like `"Data loaded successfully"` without a clear status flag, requiring extra handling on the client side.



 ## 📦Project Setup Instructions 

 1. **Clone the repository**
   ```bash
   git clone <https://github.com/adithyanvlmna/Flutterkart.git>
   cd flutterkart

 2.  Install dependencies
   ```bash
   flutter pub get
   fvm flutter pub get

2.  Run the application
  ```bash
   flutter run
   fvm flutter run