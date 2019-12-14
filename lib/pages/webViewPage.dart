import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hello_cnode/widgets/loadingOrDefault.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({this.url, this.title});

  final String url;
  final String title;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  int _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _stackToView,
          children: [
            Column(
              children: <Widget>[
                Expanded(
                    child: WebView(
                  initialUrl: widget.url,
                  debuggingEnabled: true,
                  onPageFinished: _handleLoad,
                  javascriptMode: JavascriptMode.unrestricted,
                )),
              ],
            ),
            Container(
              color: Colors.white,
              child: loading(),
            ),
          ],
        ));
  }
}
