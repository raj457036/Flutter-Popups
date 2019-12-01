import 'package:flutter/material.dart';
import './popup/popup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'PopUps'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PopupController _controller = PopupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Popup(
                content: Text('Liked so put a star'),
                child: Icon(Icons.info),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Popup(
                content: Text('Basically you can put anything inside popups'),
                child: Icon(Icons.info),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Popup(
                content: Text('You got the Idea'),
                child: Icon(Icons.info),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Popup(
                content: getLoadingWidget(),
                child: Icon(Icons.info),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Popup(
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Image.network('https://source.unsplash.com/random/'),
                      Text('With an Image and also scrollable'),
                      Image.network(
                          'https://source.unsplash.com/random/?plane'),
                    ],
                  ),
                ),
                child: Icon(Icons.info),
                size: Size(200.0, 300.0),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Popup(
                controller: _controller,
                content: Column(
                  children: <Widget>[
                    Image.network('https://source.unsplash.com/random/'),
                    Text('With an Image too'),
                  ],
                ),
                child: Icon(Icons.info),
                size: Size(200.0, null),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Popup(
                content: Text('Some Sample Text for reference'),
                child: Icon(Icons.info),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Popup(
                content: getSampleBox2(CrossAxisAlignment.center),
                child: Icon(Icons.info),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Popup(
                content: getSampleBox1(CrossAxisAlignment.start),
                child: Icon(Icons.info),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSampleBox1(CrossAxisAlignment align) {
    return Container(
      child: Column(
        crossAxisAlignment: align,
        children: <Widget>[
          Text(
            'Title',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text('Information with a title and more')
        ],
      ),
    );
  }

  Widget getSampleBox2(CrossAxisAlignment align) {
    return Container(
      child: Column(
        crossAxisAlignment: align,
        children: <Widget>[
          Text(
            'Popup with Button',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'With a controller to control the popups too 😊',
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Click me'),
            onPressed: () => _controller.opened
                ? _controller.closePopup()
                : _controller.openPopup(),
          )
        ],
      ),
    );
  }

  Widget getLoadingWidget() {
    return Column(
      children: <Widget>[
        Image.network(
          'https://source.unsplash.com/random/?lion',
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Text('With a Loader Too...😎')
      ],
    );
  }
}
