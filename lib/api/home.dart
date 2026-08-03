// 封装一个 api，目的为返回业务侧要的数据结构

import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<Banneritem>> getBannerListAPI() async {
  return (await diorequest.get(HttpConstants.BANNER_URL) as List)
  .map((item)
    {
      return Banneritem.fromJson(item as Map<String,dynamic>);
  }).toList();
}