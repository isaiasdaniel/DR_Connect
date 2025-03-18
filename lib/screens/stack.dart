

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_joe/config/i18n/index.dart';
import 'package:maple_joe/screens/map_search/index.dart';
import 'package:maple_joe/screens/mine/index.dart';
import 'package:maple_joe/screens/ranking/index.dart';
import 'package:maple_joe/store/global.dart';


Map<String,dynamic> trans = getLangText('main');

class StackScreen extends StatelessWidget {
   StackScreen({Key? key}) :super(key: key);

  static final List<Widget> _widgetOption = <Widget>[
   const MapSearch(),
    const RankingScreen(),
    const MineScreen(),
  ];

  List<BottomNavigationBarItem> stackLis = [for(var el in <dynamic>[
    [Icons.search_outlined,0],
    [Icons.bar_chart,1],
    [Icons.person,2],
  ])BottomNavigationBarItem(
   icon:  Icon(el[0]),
   label: trans['tabs'][el[1]],
   // backgroundColor: Colors.greenAccent,
   tooltip:'',
   )];
  @override
  Widget build(BuildContext context) {
    final MapController ctl = Get.put(MapController());
    return Obx(() =>
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type:BottomNavigationBarType.shifting, 
            items: stackLis,
            currentIndex: ctl.currentTabIndex.value,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            onTap: (index)=>{
            ctl.transferTab(index),
          },
          ),
          body:IndexedStack(
            index: ctl.currentTabIndex.value,
            children: _widgetOption,
          ) ,
        ));
  }
}
