class AuthResponse {
  String loginResponse;
  bool isAgent;
  String customerId;
  String customerName;
  String mobile;

  AuthResponse(
      {this.loginResponse,
      this.isAgent,
      this.customerId,
      this.customerName,
      this.mobile});

  AuthResponse.fromJson(Map json)
      : loginResponse = json["loginResponse"],
        isAgent = json["isAgent"],
        customerId = json["customerId"],
        customerName = json["customerName"],
        mobile = json["mobile"];

  Map toJson() {
    return {
      'loginResponse': loginResponse,
      'isAgent': isAgent,
      'customerId': customerId,
      'customerName': customerName,
      'mobile': mobile
    };
  }
}
