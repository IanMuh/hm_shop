import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final SpecialRecommendedResult specialRecommendedResult;
  const HmSuggestion({super.key, required this.specialRecommendedResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  // 取前三条数据
  List<GoodsItem> _getDisplayItems() {
    if (widget.specialRecommendedResult.subTypes.isEmpty) return [];
    return widget.specialRecommendedResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  List<Widget> _getChildrenList() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("lib/assets/home_cmd_sm.png");
              },
              list[index].picture,
              width: 100,
              height: 140, 
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(child: Text("￥${list[index].price}")),
        ],
      );
    });
  }

  Widget _builderHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            color: Color.fromARGB(255, 124, 63, 58),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_sm.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          _builderHeader(),
          SizedBox(height: 10),
          Row(
            children: [
              _buildLeft(),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _getChildrenList())),
            ],
          )
        ]
      ),
    );
  }
}
