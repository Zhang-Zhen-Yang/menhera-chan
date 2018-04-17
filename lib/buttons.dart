import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context)=> new Page();
}

class Page extends StatefulWidget{

  @override
  createState() => new PageState();
}

class PageState extends State<Page>{

  @override
  Widget build(BuildContext context){
    String _dropdownSelectedValue = 'banana';
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('buttons'),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
            child: new RaisedButton(
              child: new Text(
                'RaisedButton',
                // style: new TextStyle(color: Colors.white)
              ),
              color: Colors.teal,
              textColor: Colors.white,
              splashColor: Colors.green,
              highlightColor: Colors.orange,
              onPressed: (){},
            )
          ),
          new Center(
            child: new FlatButton(
              child: new Text(
                'app',
                // style: new TextStyle(color: Colors.white)
              ),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: (){}, 
            ),
          ),
          new Center(
            child: new CupertinoButton(
              child: new Text('cupertino'),
              onPressed: (){},
              color: Colors.teal,
              pressedOpacity: 0.5,
            )
          ),
          new Center(
            child: new DropdownButton(
              hint: new Text('选择你喜欢的水果'),
              value: _dropdownSelectedValue,
              items: <DropdownMenuItem>[
                new DropdownMenuItem(value: 'apple',child: new Text('apple')),
                new DropdownMenuItem(value: 'banana', child: new Text('banana')),
                new DropdownMenuItem(value: 'orange', child: new Text('orange'))
              ],
              onChanged: (String val){
                print(val);
                setState((){
                  _dropdownSelectedValue = val;
                });
              },
                
            )
          ),
          new Center(
            child: new IconButton(
              onPressed: (){},
              icon: new Icon(Icons.check),
              color: Colors.teal,
              disabledColor: Colors.red,
              highlightColor: Colors.orange,
              splashColor: Colors.red,
            )
          ),
          new Center(
            
              /*child: new Container(
                child: new Text('apppp'),
                padding: new EdgeInsets.all(12.0), 
              ),*/
              /*child: new Container(
                child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                padding: new EdgeInsets.all(12.0), 
              ),*/
              child: new Stack(
                children: <Widget>[
                  new Container(
                    child: new Opacity(
                      opacity: 1.0,
                      child:new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                    ), 
                    padding: new EdgeInsets.all(13.0),
                  ),
                  //new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),                 
                  new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      child: new Container(
                        child: new Opacity(
                          opacity: 0.0,
                          child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                        ),
                        padding: new EdgeInsets.all(12.0),
                      ),
                      onTap: (){},
                    )
                  )

                ],
              ),
    
              /*highlightColor: Colors.red,
              splashColor: Colors.teal,*/

            ),
            new Center(
              child: new RawMaterialButton(
                onPressed: (){},
                //child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg'),
                child: new Text('appleappleappleappleappleappleappleappleappleappleappleappleappleappleapple'),
                constraints: new BoxConstraints(minWidth: 100.0, maxWidth: 200.0),
                padding: new EdgeInsets.all(12.0)

              )
            ),
            /*new Center(
              child: new Positioned.fill(
                left: 100.0,
                top: 100.0,
                child: new Image.network('http://img2.178.com/acg1/201312/181193085837/181196147567.jpg')
              ),
            )*/
          
        ],
      )
    );
  }
}




/*import 'package:flutter/material.dart'; 
void main() => runApp(new MyApp()); 
 class MyApp extends StatelessWidget {   
   @override   Widget build(BuildContext context) {     
     final title = 'InkWell Demo';      
     return new MaterialApp(       
       title: title,       
       home: new MyHomePage(title: title),     );  
       } 
      }  
    class MyHomePage extends StatelessWidget {   
      final String title;
      MyHomePage({Key key, this.title}) : super(key: key); 
      @override   Widget build(BuildContext context) {
        return new Scaffold(
          appBar: new AppBar( title: new Text(title), ),       
          body: new Center(child: new MyButton()),     );   } }  
    class MyButton extends StatelessWidget {   
      @override   Widget build(BuildContext context) { 
        // The InkWell Wraps our custom flat button Widget    
        return new InkWell(       
          // When the user taps the button, show a snackbar       
          onTap: () {         
            Scaffold.of(context).showSnackBar(
              new SnackBar(
                content: new Text('Tap'),         ));       },       
            child: new Container( 
              padding: new EdgeInsets.all(12.0), 
            child: new Text('Flat Button'),       ),     );   } }


*/