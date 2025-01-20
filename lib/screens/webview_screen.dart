import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});
  static String id = 'WebVeiw';

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController controller;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
   
  // }

  @override
  Widget build(BuildContext context) {
     var args = ModalRoute.of(context)!.settings.arguments as News;
    //controller = WebViewController()..loadRequest(Uri.parse(args.url ?? ''));

    print('The url is ${args.url}');
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
