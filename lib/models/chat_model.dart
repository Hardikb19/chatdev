class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Klimatic Bot",
      message: "Its Chilly Man",
      time: "15:30",
      avatarUrl: "klimatic.png"
  ),
];
