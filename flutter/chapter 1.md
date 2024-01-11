## 01-1 크로스 플랫폼 앱 개발과 플러터

플러터 Flutter ?
> 크로스 플랫폼에서 동작하는 앱을 만드는 기술.
> IOS , 윈도우, macOS, 리눅스, 웹 ,임베디드 등 여러 플랫폼에서 동작하는 앱을 같은 코드로 개발할 수 있음.

### 모바일 앱을 개발하는 기술

- 네이티브 앱 개발 

네이티브 ? 
>플랫폼에 종속된 방법을 의미하는 용어로 안드로이드, ios처럼 각 플랫폼에 종속된 코드를 네이티브 코드라 부른다.

사용하는 언어 > 안드로이드 (Java, Kotlin), iOS (Objective-C, Swift)

- 크로스 플랫폼 앱 개발

1) 아이오닉
> 웹 앱 방식으로 개발하는 크로스 플랫폼 프레임워크 

2) 리액트 네이티브 
> React를 기반으로 하는 모바일 크래스 플랫폼 프레임워크. 자바스크립트로 모바일 앱을 개발한다는 특징이 있음.

3) 플러터
> 구글에서 만든 크로스 플랫폼 개발 프레임워크. 모바일뿐만 아니라 웹, 윈도우, 리눅스, macOS용 애플리케이션 개발도 가능.

## 01-2 플러터 아키텍처와 특징

### 플러터 아키텍처 살펴보기

<img src="https://github.com/park-chaerin/chaerin-study/assets/70634789/5fe06f21-1a93-468c-9855-8e9e983cad2c" width="1000">

+ 프레임워크 구조 살펴보기

#### 프레임워크 
> 다트언어로 개발. 앱 개발 시 프레임워크에서 제공하는 다양한 API 이용.
#### 엔진 
> - 개발한 앱을 플러터 엔진이 실행. 대부분 C++로 작성되어 있음. 
> - 엔진의 'Platform Channels'기능 : 각 플랫폼의 네이티브 코드와 연동하는 방법을 제공.
> - Skia라는 그래픽 엔진으로 애플리케이션의 화면 직접 출력.
#### 임베더 
> - 각 플랫폼에 맞게 애플리케이션이 동작할 수 있도록 해줌.
> - 안드로이드용 임베더 : 자바, C++ / iOS, macOs용 임베더 : 오브젝티브-C, C++ / 윈도우와 리눅스용 : C++

--> 플러터로 개발하면 프레임워크와 엔진 부분이 같기 때문에 모든 플랫폼에서 동작하는 애플리케이션을 똑같은 코드로 작성 가능.
   
### 플러터 특징 살펴보기
#### 1. 크로스 플랫폼 프레임워크
#### 2. 다트 언어로 개발
#### 3. 뛰어난 성능과 강력한 애니메이션 기법 제공
#### 4. 모든 플랫폼에도 똑같은 UI 제공가능 
#### 5. 네이티브 기능과 최소한으로만 연동.