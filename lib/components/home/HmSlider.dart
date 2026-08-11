import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<Banneritem> bannerList;

  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {

  Widget _getSlider() {
    // 在 flutter 中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width;
    // 返回轮播图插件
    // 根据数据渲染的不同的轮播选项
    return CarouselSlider(items: List.generate(widget.bannerList.length, (index) {
      return Image.network(widget.bannerList[index].imgUrl,
      fit: BoxFit.cover,
      width: screenWidth,
      );
    }), options: CarouselOptions(
      viewportFraction: 1.0,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 1), // 切换间隔时间
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getSlider(),
      ],
    );
  }
}