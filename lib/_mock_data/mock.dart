import 'package:tiktok_tut/models/user.dart';
import 'package:tiktok_tut/models/video.dart';

User currentUser = User("Areej zuhairi", "https://picsum.photos/250?image=9");

User demoUser1 = User("user 1", "https://picsum.photos/250?image=9");
User demoUser2 = User("user 2", "https://picsum.photos/200/300");
User demoUser3 = User("user 3", "https://picsum.photos/250?image=9");
User demoUser4 = User("user 4", "https://picsum.photos/250?image=9");

final List<Video> videos = [
  Video("v1.mp4", demoUser1, 'caption', 'audioName', '12.9 M', '278k'),
  Video("v2.mp4", demoUser2, 'caption', 'audioName', '12.9 M', '278k'),
  Video("v1.mp4", demoUser3, 'caption', 'audioName', '12.9 M', '278k'),
  Video("v2.mp4", demoUser4, 'caption', 'audioName', '12', '0'),
];
