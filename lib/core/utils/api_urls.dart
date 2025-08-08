class ApiUrls {
  static const String baseUrl = "https://app.ecominnerix.com/api";
  static const String loginUrl = "/login";
  static const String otpUrl = "/request-otp";
  static const String verifyotpUrl = "/verify-email-otp";
  static const String registerUrl = "/register";
  static const String loadHomeProduct = "/v1/home";
  
  static String loadProducts({required int shopid, required int curPage}) {
    return "/products?shop_id=$shopid&page_size=100&page=$curPage";
  }

}
