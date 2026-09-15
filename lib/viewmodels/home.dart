import 'package:flutter/foundation.dart';

class Banneritem {
  String id;
  String imgUrl;

  Banneritem({required this.id, required this.imgUrl});

  // 创建一个 工厂函数，一般使用 factory 来声明，一般用来创建实例对象
  factory Banneritem.fromJson(Map<String,dynamic> json) {
    return Banneritem(id: json["id"] as String, imgUrl: json["imgUrl"] as String);
  }
}

class CategoryItem {
  String id;
  String picture;
  String name;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.picture,
    required this.name,
    this.children,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] as String,
      picture: json['picture'] as String,
      name: json['name'] as String,
      children: json['children'] == null
          ? null
          : (json['children'] as List)
                .map(
                  (item) => CategoryItem.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
    );
  }


}