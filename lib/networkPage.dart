import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:flutter/services.dart'; //show rootBundle;

class NetWorkPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => new NetWorkWidget();
}

class NetWorkWidget extends StatefulWidget{
  @override
  createState() => new NetWorkState();
}

class NetWorkState extends State<NetWorkWidget>{
  List list = [];
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/list.json');
  }
  @override
  initState(){
    super.initState();
    Runes input = new Runes('\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
    print(new String.fromCharCodes(input));
  }
  _getResource() async{
    var url = 'http://192.168.1.132:5000/users';
    /*loadAsset().then((value){
      JsonDecoder decoder = new JsonDecoder();
      List json = decoder.convert(value);
      print(json);
      setState((){
        list = json;
      });
    });*/
    
    /*http.get(url).then((http.Response response){
      // 响应的主体作为字符串返回
      String netdata = response.body;
      // JsonDecoder类解析JSON字符串并构建相应的对象
      JsonDecoder decoder = new JsonDecoder();
      // 将给定的JSON字符串输入转换为其对应的对象
      List json = decoder.convert(netdata);
      // 输出给定的JSON数据
      setState((){
        list = json;
      });
    }, onError: (e){
      print(e);
    });*/
    
    /*var httpclient=createHttpClient();//获取http对象
    var response = await httpclient.read(url);//发送网络请求，read()表示读取返回的结果，get()表示不读取返回的结果
    print('Response=$response');*/
         
    var httpclient=createHttpClient();//获取http对象
    httpclient.get(url).then((e){
      print(e.body);
      JsonDecoder decoder = new JsonDecoder();
      // 将给定的JSON字符串输入转换为其对应的对象
      List json = decoder.convert(e.body);
      // 输出给定的JSON数据
      setState((){
        list = json;
      });
    });
  }

  List<Widget> renderList(){
    return list.map((item){
      return new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Image.network(item['img']),
            height: 100.0,
          ),
          new Text(item['name'])
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('network'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new CircularProgressIndicator()
          ),
          new Center(
            child: new RaisedButton(
              child: new Text('Get'),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: _getResource,
            )
          ),
          new Column(
            children: renderList(),
          ),
          
        ],
      ),
    );
  }
}