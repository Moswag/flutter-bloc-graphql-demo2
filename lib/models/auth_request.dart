class AuthRequest{
  String bankConf;
  String imei;
  String simCardSerial;
  String appId;
  String pin;

  AuthRequest({this.bankConf, this.imei, this.simCardSerial, this.appId, this.pin});

  AuthRequest.fromJson(Map json)
      : bankConf = json["bankConf"],
        imei = json["imei"],
        simCardSerial = json["simCardSerial"],
        appId = json["appId"],
        pin = json["pin"];

  Map toJson() {
    return {
      'bankConf': bankConf,
      'imei': imei,
      'simCardSerial': simCardSerial,
      'appId': appId,
      'pin': pin
    };
  }
}