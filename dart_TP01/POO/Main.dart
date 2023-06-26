import 'classes/User.dart';

void main() {
  final User johnDoe = new User("John", "Doe", "john@doe.com");

  print(johnDoe.toString());
  johnDoe.password = "password";
  print(johnDoe.toString());

  johnDoe.sayHello();
}
