void sayHello(String param) {
  print("Hello, ${param} !");
}

int somme(int a, int b) {
  return a + b;
}

int sumMany(List<int> list) {
  return list.reduce((a, b) => a + b);
}

void sumAndPrint(num a, num b, bool shouldPrint) {
  num res = a + b;
  if (shouldPrint) {
    print("${a} + ${b} = ${res}");
  }
}

void sumAndFormat(num a, num b, [bool? format]) {
  num res = a + b;
  if (format != null && format) {
    print(res.toDouble());
  } else {
    print(res);
  }
}

String reversedString(String hello) => hello.split('').reversed.join();

int fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}