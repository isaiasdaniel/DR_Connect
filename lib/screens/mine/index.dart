import 'package:flutter/material.dart';
import 'package:maple_joe/config/i18n/index.dart';
import 'package:maple_joe/constants/asset_path.dart';
import 'package:maple_joe/utils/ui/ui_utils.dart';

List<dynamic> transList = getLangText('mine')['list'];

class MineScreen extends StatefulWidget {
  const MineScreen({Key? key}) : super(key: key);
  @override
  _MineScreen createState() => _MineScreen();
}

final list = [
  Icons.colorize_rounded,
  Icons.developer_board,
  Icons.settings,
];

class _MineScreen extends State<MineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          header,
          _Body()
        ],
      ),
    );
  }
}

var header =  Container(
  child: Stack(
    children: [
      const Positioned(
        child: Text('maple'),
        bottom: 20,
        right: 20,
      )
    ],
  ),
  constraints: const BoxConstraints.expand(height: 300),
  decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagePath.get('girl')))),
);

class _Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Expanded(
      child: ListView(padding: EdgeInsets.zero, children: [
        for (var i = 0; i < list.length; i++)
          ListTile(
            leading: Icon(list[i]),
            title: Text(transList[i]),
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
            // shape: Border(bottom: BorderSide(color: Colors.grey.shade50)),
            onTap: () => {Util.print(context, '223332')},
          )
      ]),
    );
  }
}