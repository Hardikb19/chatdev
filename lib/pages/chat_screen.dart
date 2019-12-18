import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: dummyData.reversed.map((data) => new Dismissible(
        key: Key(data.name),
            child: Column(children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                leading: Stack(
                  alignment: Alignment.center,
                  children:<Widget>[
                 new CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 21.0,
                  ),
                 new CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: new AssetImage(data.avatarUrl),
                  ),
                  ]
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      data.name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      data.time,
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    data.message,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),)).toList()
          );
  }
}
