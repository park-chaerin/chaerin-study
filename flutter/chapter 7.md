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
- 컴파일러가 자동으로 부모의 클래스의 기본 생성자를 호출해 줌.
```dart
//부모 생성자 호출 예시
class SuperClass{
  SuperClass(int arg) {}
  SuperClass.first(){}
}
class SubClass extends SuperClass{
  SubClass() : super(10) {}   //성공
  // SubClass() : super() {}  //만약 부모 생성자가 매개변수나 명명된 생성자를 가진다면 super()문을 생략하면 오류!
  SubClass.name() : super.first(){}   //성공
}
```

### 부모 클래스 초기화
```dart
// 객체를 생성할 때 전달받은 값으로 클래스의 멤버 변수를 초기화할 때는 생성자의 매개변수에 this 사용
class User{
  String name;
  int age;
  User(this.name, this.age);
}
```
- 부모 클래스에 선언된 멤버를 초기화해야 할 때는 부모 클래스의 생성자를 호출하는 super() 구문에 매개변수값을 전달하면 됨.
```dart
// 부모 클래스의 멤버 변수 초기화 예시
class SuperClass{
  String name;
  int age;
  SuperClass(this.name, this.age){}
}
class SubClass extends SuperClass{
  SubClass(super.name, super.age);  
  //혹은 SubClass(String name, int age) : super(name,age) {}
}
main(){
  var obj = SubClass('kkang', 10);
  print('${obj.name}, ${obj.age}');
}
```

## 07-2 추상 클래스와 인터페이스
### 추상 클래스 
- 추상 함수만 제공하여 상속받는 클래스에서 받드시 재정의해서 사용하도록 강제하는 방법.
- 추상 함수 : 본문이 없는 함수.
- 추상클래스를 상속받은 자식 클래스에서 추상 함수를 재정의 해줘야 함.
```dart
//추상 클래스 선언
abstract class User{
  void some();
}
```

### 인터페이스 (다트에서는 interface 예약어 지원 X)
- 부모의 특징을 도구로 사용해 새로운 특징을 만들어 사용하는 객체지향 프로그래밍 방법.
- 자바에서는 interface로 인터페이스를 선언, implements 예약어로 인터페이스를 구현하는 클래스 선언.
- 다트에서는 implements만 지원. (인터페이스를 선언하지 않아도 다른 클래스를 도구 삼아 구현 방법 제공.)
```dart
// 일반 클래스
class User{
  int no;
  String name;
  
  User(this.no, this.name);
  String greet(String who) => 'Hello, $who. I am $name. no is $no';
}

// 자식 클래스
class MySubClass extends User{
  MySubClass(super.name, super.no);
}

//인터페이스 구현 클래스 선언
class MyClass implements User{  //User 클래스는 암시적 인터페이스, MyClass는 User를 새로 구현한 클래스.
  // implements를 사용해 새로운 클래스를 구현하였으면 대상 클래스에 선언된 모든 멤버를 재정의 해야함. 
  int no = 10;  
  String name = 'kim';
  @override
  String greet(String who){
    return 'hello';
  }
}
```
## 07-3 멤버를 공유하는 믹스인
### 믹스인 (Mixin)
- mixin 예약어로 선언. (class 사용 X)
- 변수와 함수 선언은 가능하지만, 생성자 선언은 불가.(클래스가 아니니까)
- 객체를 생성할 수도 없음.(생성자가 없으니까)
### 믹스인 사용하기
- 대부분의 객체지향 언어에서는 다중 상속 지원 X.
```dart
class A1{}
class A2{}
class MySub extends A1, A2{} // 다중 상속 오류!
```
- 다트는 다중 상속을 지원하지 않는 대신 다른 클래스에서 사용할 수 있는 멤버를 선언할 수 있도록 믹스인 제공.
- 믹스인에 선언한 멤버를 다른 클래스에서 사용 가능. (with 예약어 사용.)
```dart
//믹스인 멤버 이용 예시
mixin MyMixin{
  int mixinData = 10;
  void mixInFun(){
    print('MyMixin.. mixInFun()...');
  }
}

class MyClass with MyMixin{
  void sayHello(){
    print('data : $mixinData');
    mixInFun();
  }
}
```
- [Mixin을 다중 상속처럼 사용한 예시](Dart/mixin.dart) -> 코드 예시

### 믹스인 사용 제약
- 믹스인은 모든 클래스에서 with예약어로 사용 가능.
- 특정 타입에 클래스에서만 사용하도록 제한도 가능. (on 사용.)
```dart
mixin MyMixin on MySuper{   //on 사용으로 MySuper를 지정.
  
}
class MySuper{
  
}
class MyClass extends MySuper with MyMixin{   //성공!
  
}
class MySomeClass with MyMixin {   //오류!
  //MySuper를 상속받은 MyClass에서는 MyMixin을 사용할 수 있지만, MySomeClass에서는 사용 불가.
  
}
```
### with로 클래스 이용하기
- 클래스도 with 사용 가능.
```dart
// with로 클래스 이용 예시
class SomeClass{
  int someData = 10;
}

class MyClass with SomeClass{
  void sayHello(){
    print('someData: $someData');
  }
}
```
- 보통은 extends로 상속받아 이용하지만 믹스인처럼 with로도 이용 가능함.
- 믹스인은 다른 클래스에서 공통으로 사용할 변수나 함수를 믹스인 안에 담아 두고 필요한 클래스에서 with로 연결해서 사용.
- 생성자가 있는 클래스를 with으로 사용하면 오류!!
```dart
class User{
  User(){}
}
class MyClass with User{ }  //오류!!
```

| 믹스인   | 클래스      |
|----------|-----------------|
| 객체 생성 불가 | 객체 생성 가능|