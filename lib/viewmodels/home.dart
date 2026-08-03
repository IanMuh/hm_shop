class Banneritem {
  String id;
  String imgUrl;

  Banneritem({required this.id, required this.imgUrl});

  // 创建一个 工厂函数，一般使用 factory 来声明，一般用来创建实例对象
  factory Banneritem.fromJson(Map<String,dynamic> json) {
    return Banneritem(id: json["id"] as String, imgUrl: json["imgUrl"] as String);
  }
}