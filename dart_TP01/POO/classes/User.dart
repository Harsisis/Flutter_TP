class User {
  String firstName;
  String lastName;
  String email;
  String? _password;

  User(String this.firstName, String this.lastName, String this.email);

  void set password(String password) {
    this._password = password;
  }

  @override
  String toString() {
    return "${this.firstName} ${this.lastName} | mail: ${this.email} " +
        "| passwd: ${this._password?.replaceAll(RegExp('[^ ]'), '*')} ";
  }

  void sayHello() {
    print("Hello, I'm ${this.firstName} ${this.lastName} !");
  }
}
