import 'package:flutter/cupertino.dart';
import 'package:flutter_demo_wangyiyun_music/model/play_list.dart';
import 'package:flutter_demo_wangyiyun_music/model/user.dart';

class PlayListModel with ChangeNotifier{
  User user;

  List<Playlist> _selfCreatePlayList = []; // 我创建的歌单
  List<Playlist> _collectPlayList = []; // 收藏的歌单
  List<Playlist> _allPlayList = []; // 所有的歌单

  List<Playlist> get selfCreatePlayList => _selfCreatePlayList;

  List<Playlist> get collectPlayList => _collectPlayList;

  List<Playlist> get allPlayList => _allPlayList;
}