import &#39;package:flutter/material.dart&#39;;
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(&#39;Flutter Column Layout&#39;),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: &lt;Widget&gt;[
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.red,
              child: Text(
                &#39;Item 1&#39;,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.green,
              child: Text(
                &#39;Item 2&#39;,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
              child: Text(
                &#39;Item 3&#39;,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
