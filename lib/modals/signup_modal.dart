class SignupData {
  final String name;
  final String email;
  final int phone;
  final String password;
  final String confirmPassword;

  SignupData(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.confirmPassword});

  factory SignupData.fromJson(data) {
    return SignupData(
        name: data["name"],
        email: data["email"],
        phone: data["phone"],
        password: data["password"],
        confirmPassword: data["confirmPass"]);
  }
}
