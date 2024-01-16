/// 캐시 알고리즘 구현 예시
/// 캐시 알고리즘 : 캐시에 자주 사용되는 데이터를 저장하고 그 데이터가 필요할 때 반환.
/// 어떤 방식의

class Image{
  late String url;
  static Map<String, Image> _cache = <String, Image>{};
  Image._instance(this.url);
  factory Image(String url){
    if (_cache[url] == null){             // 전달받은 식별자가 캐시에 없으면
      var obj = Image._instance(url);     // 해당 식별자로 객체를 새로 생성하고
      _cache[url] = obj;                  // 캐시에 추가
    }
    return _cache[url]!;                //캐시에서 식별자에 해당하는 객체 반환.
  }
}

main() {
  var image1 = Image('a.jpg');
  var image2 = Image('a.jpg');
  print('image1 == image2 : ${image1 == image2}');

}