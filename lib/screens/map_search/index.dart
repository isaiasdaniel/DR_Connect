import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maple_joe/config/i18n/index.dart';
import 'package:maple_joe/screens/map_search/widgets/virtual_webview.dart';
var transText = getLangText('map_search');
class MapSearch extends StatefulWidget {
  const MapSearch({Key? key}) : super(key: key);

  @override
  _MapSearch createState() => _MapSearch();
}

class _MapSearch extends State<MapSearch> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController searchContr = TextEditingController();
  var searchUrl = '';

  onSearch() async {
    // if (_formKey.currentState!.validate()) {
    //
    // }
    // var res = await GetConnect()
    //     .get('https://www.baidu.com/s?wd=' + searchContr.text);
    if (searchContr.text != '') {
      setState(() {
        searchUrl = 'http://cn.bing.com?q=' + searchContr.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      // style: TextStyle(height: .2),
                      controller: searchContr,
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        hintText: transText['search_hint'],
                        // border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        text = text.toLowerCase();
                      },
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return '请输入内容';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: onSearch,
                      ))
                ],
              ),
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Center(
          child: VirtualWebView(
            key: Key(searchUrl),
            url: searchUrl,
          ),
        ),
      ),
    );
  }
}
