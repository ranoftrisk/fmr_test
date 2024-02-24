class AuthRepo {
  final String _mockPin = "123456";

  Future<bool> checkPin(String pin) async {
    return pin == _mockPin;
  }
}
