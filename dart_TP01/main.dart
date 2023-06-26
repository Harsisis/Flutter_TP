import 'string_dart.dart';

void main() {
// 1
  print("\n## 1");
  HelloWorld();
// 2
  print("\n## 2");
  PrintBis("Hello World Bis");
// 3
  print("\n## 3");
  const String HELLO = "Hello";
  const String WORLD = "World";
  PrintInterpolation(HELLO, WORLD);
// 4
  print("\n## 4");
  PrintConcatenation(HELLO, WORLD);
// 5
  print("\n## 5");
  PrintFirstWord("Hello World !");
// 6
  print("\n## 6");
  const String HELLO_WORLD = "Hello World !";
  PrintStringLenght(HELLO_WORLD);
//7
  print("\n## 7");
  const String WELCOME = "Hello, World !";
  PrintReplaceLetters(WELCOME);
//8
  print("\n## 8");
  const WELCOME_WORLD = "Hello World";
  List<String> words = GetListOfWords(WELCOME_WORLD);
  print(words.length);
//9
  print("\n## 9");
  String pwd = "";
  PrintCheckPassword(pwd);
  pwd = "notEmpty";
  PrintCheckPassword(pwd);
//10
  print("\n## 10");
  String mail = "notAMail";
  PrintCheckMail(mail);
  mail = "mail@mail.com";
  PrintCheckMail(mail);
}
