import 'package:flutter/cupertino.dart';
import 'package:maple_joe/screens/map_search/index.dart';
import 'package:maple_joe/screens/mine/index.dart';
import 'package:maple_joe/screens/ranking/index.dart';
import 'package:maple_joe/screens/stack.dart';
import 'package:maple_joe/screens/webview/index.dart';
 const routeNames = {
  'main': '/',
  'home': '/home',
  'ranking': '/ranking',
  'mine': '/mine',
  'webview': '/webview',
};
class MapRoute {
  static String initRoute = '/';
  // BuildContext context;
  MapRoute(BuildContext context){

  }

  final routes = {
  '/':(context)=> StackScreen(),
  '/home':(context)=>const MapSearch(),
  '/ranking':(context)=>const RankingScreen(),
  '/mine':(context)=>const MineScreen(),
  '/webview':(context,{title='',url=''})=> WebViewScreen(url: url,title: title,),
  };

}