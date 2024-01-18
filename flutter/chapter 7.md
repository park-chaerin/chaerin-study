## 07-1 상속 알아보기

### 상속과 오버라이딩
- 상속 : 클래스를 재활용하는 객체지향 프로그래밍의 핵심 기능.
  - 다트에서는 클래스 상속을 받을 때 extends 예약어를 사용함.
- 오버라이딩 : 클래스를 상속받앗을 때 부모 클래스의 선언된 멤버를 그대로 사용하지 않고 재정의 하는 것.
```dart
class SuperCalss{
  int myData = 10;
  void myFun() {
    print('Super .. myFun()...');
  }
}

class SubClas extends SuperClass{       //SuperClass 상속받음,
  int myData = 20;
  void myFun(){
    super.myFun();          //만약 자식 클래스에서 부모 클래스에 선언된 똑같은
                            // 이름의 멤버를 사용하고 싶으면 super라는 예약어로 접근.
    print('Sub...myFun()...');
  }
}
```

### 부모 생성자 호출하기
#### 상속 기능을 이용할 때 꼭 기억해야 할 내용!
- 자식 클래스의 객체를 생성할 때 자신의 생성자가 호출되는데, 부모 클래스의 생성자도 반드시 호출되게 해줘야 함.
