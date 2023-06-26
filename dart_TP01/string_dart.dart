void helloWorld() {
  print("Hello World !");
}

void printBis(String message) {
  print(message);
}

void printInterpolation(String chaine1, String chaine2) {
  print("${chaine1} ${chaine2}!");
}

void printConcatenation(String chaine1, String chaine2) {
  print(chaine1 + " " + chaine2);
}

void printFirstWord(String sentence) {
  print(sentence.split(" ")[0]);
}

void printStringLenght(String string) {
  print(string.length);
}

void printReplaceLetters(String string) {
  string = string.replaceAll(RegExp(r'e'), '3');
  string = string.replaceAll(RegExp(r'l'), '1');
  string = string.replaceAll(RegExp(r'o'), '8');
  print(string);
}

List<String> getListOfWords(String string) {
  return string.split(" ");
}

void printCheckPassword(String password) {
  print(password.isEmpty ? "password empty" : "password not empty");
}

void printCheckMail(String email) {
  bool isEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  print(isEmail ? "Email valid" : "Email invalid");
}
