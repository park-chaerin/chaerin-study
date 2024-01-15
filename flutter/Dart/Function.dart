void some() {}
Function data2 = some;

int plus(int no){
  return no + 10;
}

int multiply(int no){
  return no * 10;
}

Function testFun(Function argFun){
  print('argFun : ${argFun(20)}');
  return multiply;
}

main(List<String> args){
  var result = testFun(plus);
  print('result : ${result(20)}');
}

// argFun : 30
// result : 200