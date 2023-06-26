void HelloWorld() {
  print("Hello World !");
}

void PrintBis(String message) {
  print(message);
}

void PrintInterpolation(String chaine1, String chaine2) {
  print("${chaine1} ${chaine2}!");
}

void PrintConcatenation(String chaine1, String chaine2) {
  print(chaine1 + " " + chaine2);
}

void PrintFirstWord(String sentence) {
  print(sentence.split(" ")[0]);
}

void PrintStringLenght(String string) {
  print(string.length);
}

void PrintReplaceLetters(String string) {
  string = string.replaceAll(RegExp(r'e'), '3');
  string = string.replaceAll(RegExp(r'l'), '1');
  string = string.replaceAll(RegExp(r'o'), '8');
  print(string);
}

List<String> GetListOfWords(String string) {
  return string.split(" ");
}

void PrintCheckPassword(String password) {
  print(password.isEmpty ? "password empty" : "password not empty");
}

void PrintCheckMail(String email) {
  bool isEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  print(isEmail ? "Email valid" : "Email invalid");
}
