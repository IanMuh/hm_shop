import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}



class _HomeViewState extends State<HomeView> {
  List<Banneritem> _bannerList = [];

  List<Widget> _getScrollChildren() {
    return [
      SliverAppBar(
        title: Text('图片横向播放示例'),
        pinned: true,
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 200, // 必须指定固定高度
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // 关键：设置为水平滚动
            itemCount: _bannerList.length, // 图片张数
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    _bannerList[index].imgUrl,
                    width: 300, // 每张图的宽度
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ];

    // return List.generate(_bannerList.length, (index) {
    //   return Image.network(
    //     _bannerList[index].imgUrl,
    //     height: 100,
    //     width: 100,
    //   );
    // });
  }

  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerList();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: _getScrollChildren(),
    );
  }
}