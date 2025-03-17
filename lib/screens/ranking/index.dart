import 'package:flutter/material.dart';
import 'package:maple_joe/config/i18n/index.dart';
import 'package:maple_joe/screens/webview/index.dart';
import 'package:maple_joe/services/ranking.dart';

var tabs = getLangText('ranking')['tabs'];

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  _MapSearch createState() => _MapSearch();
}

class _MapSearch extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(labelColor: Colors.white, tabs: [
              for (var item in tabs)
                Tab(
                  text: item,
                )
            ]),
          ),
          body: TabBarView(
            children: [
              zhihuW(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ));
  }
}

var zhihuW = () => FutureBuilder(
    future: RankingServ.getZhihuRanking(),
    builder: (BuildContext context, AsyncSnapshot snap) {
      switch (snap.connectionState) {
        case ConnectionState.waiting:
          return const Text('loading...');
        case ConnectionState.done:
          var _clt =
              ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
          var list = snap.data.data['data'];
          return ListView.builder(
            padding: EdgeInsets.zero,
            controller: _clt,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(
                '${index + 1}.${list[index]['target']['title']}',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              shape: Border(bottom: BorderSide(color: Colors.grey.shade50)),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=> WebViewScreen(title: list[index]['target']['title'],url: list[index]['target']['url'],)))
                // Navigator.pushNamed(context, routeNames['webview']??'',)
              },
            ),
          );
        default:
          return Icon(Icons.settings);
      }
    });
