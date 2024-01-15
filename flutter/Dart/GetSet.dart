String _name = 'hello';

// get 예약어를 추가한 함수는 데이터를 가져오는 게터이기 때문에 매개변수 선언X.
String get name {
  return _name.toUpperCase();
}
// set 예약어를 추가한 함수는 데이터를 변경하는 세터이기 때문에 매개변수 필요. 해당 매개변수로 데이터 변경.
set name(value){
  _name = value;    //_name을 value로 변경.
}
main(List<String> args){
  name = "world";
  print('name: $name');
}

// name : WORLD