import 'package:flutter/material.dart';
import './pages/chat_screen.dart';

class BotHome extends StatefulWidget {
  @override
  _BotHomeState createState() => _BotHomeState();
}

class _BotHomeState extends State<BotHome>  with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 1);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(height: 10.0,child:ImageIcon(
          AssetImage('logogreen.png'),
          size: 1.0,
        ),),
        title: Text("Har-Bot"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: <Widget>[
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[Icon(Icons.details),Container(child:Text("Bots"),margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),),]
                ),
              key: Key("BOTS"),
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[ChatScreen()],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () => print("open chats"),
            )
          : null,
    );
  }
}
