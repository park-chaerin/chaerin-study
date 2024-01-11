## 02-1 플러터 프로젝트 분석하기

### 프로젝트 폴더 구성 알아보기

<img width="250" alt="image" src="https://github.com/park-chaerin/park-chaerin/assets/70634789/73dfc54c-d714-463e-9e29-0a50e2adb9a0" >

- android : 안드로이드 앱 구성 
- ios : iOS 앱 구성           
- lib : 다트 파일 
- test : 테스트 다트 파일
- lib/main.dart : 앱의 메인 다트 파일 
- .gitignore : 깃에 업로드 하지 않을 파일 등록
- pubspec.yaml : 플러터 프로젝트의 메인 환경 파일. 앱의 어떤 패키지나 리소스를 추가하려면 여기에 등록해줘야 함.

### main.dart 파일 분석하기
1. import 구문 : 다른 다트 파일을 불러올 때 사용.
> import 'package:flutter/material.dart';
2. main() 함수 : 다트 엔진의 진입점. 다트 엔진이 main()을 호출하면서 앱이 실행됨.
> void main( ){ runApp(const MyApp( ) ); }
> - main()에서 runApp()함수를 호출하고 있음.
> - 이때 매개변수로 MyApp()인 커스텀 위젯을 지정했음. (위젯 : 화면 구성하는 클래스)

3. MyApp 클래스 

<img width="600" alt="image" src="https://github.com/park-chaerin/park-chaerin/assets/70634789/99609851-4293-4f14-84bf-40189782b271">

> - 위젯 클래스는 StatelessWidget / StatefulWidget 가운데 하나를 상속받아 작성함.
> - build( ) 함수에 화면을 어떻게 구성할 지 명시.
> - 위젯 클래스가 실행되면 자동으로 build( ) 함수가 호출되고 이 함수에서 반환한 위젯이 화면에 출력됨.
> - build( ) 함수에서 MaterialApp을 사용해서 머터리얼 디자인 적용하고, 구체적인 화면은 MyHomePage위젯에서 구성함.

4. MyHomePage 클래스

<img width="400" alt="image" src="https://github.com/park-chaerin/park-chaerin/assets/70634789/237ca0a2-a98e-4c0b-8544-bbe69d91860b">

> - MyHomePage 위젯 클래스는 StatefulWidget을 상속받아 작성됨.
> - StatefulWidget은 별도의 State클래스에 화면구성과 출력 데이터 등을 저장함.
> <br>(위 사진에서는 _MyHomePageState가 State클래스)
> - StatefulWidget 클래스가 실행되면 createState( ) 함수가 자동으로 호출되고, StatefulWidget을 위한 State클래스 객체를 반환함.

## 02-1 외부 패키지 사용하기

#### pub.dev 사이트에서 외부 패키지 사용하기
1. 메인 환경 파일에 등록하여 내려받기
2. 터미널에서 명령어로 추가하기
