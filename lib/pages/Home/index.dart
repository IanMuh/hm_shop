import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/home/HmCategory.dart';
import 'package:hm_shop/components/home/HmHot.dart';
import 'package:hm_shop/components/home/HmMoreList.dart';
import 'package:hm_shop/components/home/HmSlider.dart';
import 'package:hm_shop/components/home/HmSuggestion.dart';
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

  // 获取滚动容器的内容
  List<Widget> _getScrollChildren() {
    return [
      // 轮播图
      SliverToBoxAdapter(child: HmSlider()),

      // 分类组件，不可以使用 sliverList,sliver
      SliverToBoxAdapter(child: SizedBox(height: 10,),),

      SliverToBoxAdapter(child: HmCategory(),),

      // 推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),

      SliverToBoxAdapter(child: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: HmSuggestion(),
        )
      ),

      // 爆款组件
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10,),
              Expanded(child: HmHot()),
            ],
            ),
          )
      ),

      SliverToBoxAdapter(child: SizedBox(height: 10,),),

      HmMoreList()

    ];
  }

  void _getBannerList() async {
    _bannerList = await getBannerListAPI();
    setState(() {});
  }

  @override
  void initState() {
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