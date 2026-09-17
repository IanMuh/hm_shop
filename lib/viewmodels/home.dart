import 'package:flutter/foundation.dart';

class Banneritem {
  String id;
  String imgUrl;

  Banneritem({required this.id, required this.imgUrl});

  // 创建一个 工厂函数，一般使用 factory 来声明，一般用来创建实例对象
  factory Banneritem.fromJson(Map<String, dynamic> json) {
    return Banneritem(
      id: json["id"] as String,
      imgUrl: json["imgUrl"] as String,
    );
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

class GoodsItem {
  String id;
  String name;
  String? desc;
  double price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.desc,
    required this.id,
    required this.name,
    required this.orderNum,
    required this.picture,
    required this.price,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      desc: json['desc'],
      id: json['id'],
      name: json['name'],
      orderNum: json['orderNum'] as int,
      picture: json['picture'],
      price: double.parse(json['price']),
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.page,
    required this.pageSize,
    required this.pages,
    required this.items
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] as int,
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      pages: json['pages'] as int,
      items: (json['items'] as List? ?? [])
          .map((item) => GoodsItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'],
      title: json['title'],
      goodsItems: GoodsItems.fromJson(json['goodsItems'] as Map<String, dynamic>),
    );
  }
}

class SpecialRecommendedResult {
  String id;
  String title;
  List<SubType> subTypes;

  SpecialRecommendedResult({
    required this.id,
    required this.subTypes,
    required this.title,
  });

  factory SpecialRecommendedResult.fromJson(Map<String, dynamic> json) {
    return SpecialRecommendedResult(
      id: json['id'],
      title: json['title'],
      subTypes: (json['subTypes'] as List? ?? [])
          .map((item) => SubType.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
