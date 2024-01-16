## 06-1 클래스와 객체

### 클래스 선언과 생성
- 다트에서 클래스는 class로 선언
- 객체 생성 시 new를 이용해도 되고, 생략해도 됨.
```dart
Uesr user1 = new User();

User user1 = User();
```

### 객체 멤버와 클래스 멤버
- 멤버 : 클래스에 선언한 변수나 함수
- 객체 멤버 : 생성된 객체를 이용해서 접근 <br>
```dart
User user1 = User();      //객체 생성 후 
user1.sayHello();         //객체 이름으로 접근.
user1.name = 'kim';       
usre1.age = 20;
```
- 클래스 멤버(정적 멤버) : static 예약어로 선언한 멤버.
```dart
  static myFun2() {       // 이런식으로 static을 붙여서 사용.
    print('myFun2 call....');
  }
```
- 객체 멤버는 객체 이름으로 접근할 수 있지만, 클래스 이름으로 접근하는 것은 불가능.
```dart
MyClass.data1 = 'world';  //오류! 객체생성을 하지 않고 객체 멤버를 클래스 이름으로 이용하면 안됨.
MyClass obj = MyClass(); 
obj.data1 = 'world';  //성공!
```
- static으로 선언한 클래스 멤버는 클래스 이름으로 접근할 수 있지만, 클래스 멤버는 객체로 접근 불가.
```dart
MyClass.data2 = 'world';  //성공!
MyClas obj = MyClass();
obj.data2 = 'world';    //오류! 클래스 멤버는 객체로 접근 불가함.
```

## 06-2 생성자와 멤버 초기화

### 생성자 선언
- 생성자 : 클래스에 선언되어 객체를 생성할 때 호출되는 함수.
- 모든 클래스는 생성자를 가지며, 만약 만들지 않으면 컴파일러가 자동으로 기본 생성자를 만들어줌.
```dart
class User {
  User() { }    //이런식으로 기본 생성자를 추가
}
```
- 다트에서는 명명된 생성자, 팩토리 생성자, 상수 생성자 등 다양한 형태로 정의 가능.

### 멤버 초기화하기
- this 예약어를 사용해서 간단히 매개변수로 멤버를 초기화 가능함.
```dart
class User{
  late String name;
  late int age;
  User(this.name, this.age);
  
  sayHello(){
    print('name : $name, age : $age');
  }
}
```

### 초기화 목록
- 생성자 선언 시 초기화 목록을 사용할 수 있음.
- 생성자 선언부를 콜론(:)으로 구분하여 오른쪽에 작성함.
```
User(String name, int age) : this.name = name, this.age = age { }
```
## 06-3 명명된 생성자
- 다트에서 가장 중요하고 자주 사용되는 생성자.
- 이름이 있는 생성자라는 의미로, 한 클래스에 이름이 다른 생성자를 여러 개 선언하는 기법.
- 다른 언어에서 제공하는 오버로딩과 다름. 
- 한 클래스에 클래스와 같은 이름의 생성자는 하나만 정의할 수 있지만, 명명된 생성자는 클래스와 다른 이름으로 여러 개 정의 가능.
```dart
//명명된 생성자 선언
class MyClass{
  MyClass() { }
  MyClass.first() { }
  MyClass.second() { }
}
// 명명된 생성자 객체로 만드는 코드
var obj1 = MyClass();
var obj2 = MyClass.first();
var obj3 = MyClass.secont();
```
#### 왜 오버로딩 대신 명명된 생성자를 사용할까 ? 각각의 생성자를 좀 더 쉽게 구분할 수 있음. 

### this()로 다른 생성자 호출하기
- 한 클래스에 생성자를 여러 개 선언하면, 생성자에서 다른 생성자를 호출해야할 수 있음. 이때 객체를 생성할 때 생성자가 중첩되어 호출 됨.
```dart
// MyClass(기본생성자)와 명명된 생성자 MyClass.first를 선언하고,
// MyClass.first가 호출될 때 MyClass도 실행하고 싶을때, 
// 이때 this구문을 이용할 수 있지만, this는 생성자의 { } 안쪽 본문에 생성할 수 없음!
// 다른 생성자를 호출하는 this는 생성자의 콜론(:) 오른쪽 초기화 목록에 작성해야 함.

class MyClass{
  MyClass(int data1, int data2){
    print("MyClass() call...");
  }
  //오류!
  MyClass.first(int arg){
    this(arg,0);      
  }
  
  //오류!
  MyClass.first(int arg) : this(arg,0) { } 
  
  //성공!
  MyClass.first(int arg) : this(arg,0);   
}
```
## 06-4 팩토리 생성자
- factory 예약어로 선언.
- 객체를 생성할 때 호출할 수 있지만, 생성자 호출만으로는 객체가 생성되지 않음.(팩토리 생성자서 적절한 객체 반환을 해줘야함.)
- 클래스 외부에서는 생성자처럼 이용되지만, 실제로는 클래스타입의 객체를 반환하는 함수.
- [캐시 알고리즘](Dart/factory.dart) 혹은 상속관계에 따른 다형성을 구현할 때 유용. 
```dart
//  이런식으로 객체 반환을 해줘야 함.
class MyClass{
  Myclass.first(){}
  factory MyClass(){
    return Myclass.first();   //함수가 null을 허용하지 않으면, null반환도 오류가 뜸.
  }
}
```

## 06-5 상수 생성자

### const로 생성자 선언
- 상수 생성자는 const 예약어로 선언함.
- 본문, 즉 { }를 추가할 수 없음.
- 상수 생성자가 선언된 클래스의 모든 멤버 변수는 final로 선언해야 함.
```dart
class MyClass{
  const MyClass();
}
```
### const로 객체 생성
- 객체 생성 시에도 const를 추가해 상수 객체로 만들 수 있음.
- const로 객체를 생성하려면 생성자도 const로 선언해야 함.