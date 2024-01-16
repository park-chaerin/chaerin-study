/// 클래스 멤버(Static Member) : 클래스에 속한 모든 인스턴스에서 공유되는 멤버, 클래스 이름을 통해 직접 접근 가능.

class MyClass {
  static int staticVariable = 10;

  static void staticMethod() {
    print("Static method");
  }
}

void main2() {
  // 클래스 멤버 접근
  print(MyClass.staticVariable); // 출력: 10
  MyClass.staticMethod(); // 출력: Static method
}

/// 객체 멤버(Instance Memeber) : 클래스의 각 인스턴스에 속하는 멤버, 해당 클래스의 객체를 생성한 후에만 접근 가능.

class MyClass2 {
  int instanceVariable2 = 20;

  void instanceMethod() {
    print("Instance method");
  }
}

void main() {
  MyClass2 obj = MyClass2();  //객체 생성.
  print(obj.instanceVariable2);
  obj.instanceMethod();
}

/// 인스턴스? 객체?
/// 객체 : 클래스의 인스턴스. 어떤 클래스로부터 생성된 것.
/// 인스턴스 : 객체에서 더 구체화 된 것. 객체가 그냥 자동차라면, 인스턴스는 자동차 브랜드 이름. 클래스에서 생성된 객체가 메모리에 할당되면 인스턴스.