import 'package:day6/models/customListView.dart';
import 'package:day6/models/music_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailpage.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);
  static const routeName = '/PlayList';

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  late List items;

  List getList() {
    return [
      itemlist(
          title: "everyday we fight",
          singer: "DAY6",
          image: 'assets/images/a1.jpg',
          url:
              'https://www.mboxdrive.com/everyday we fight.mp3'),
      itemlist(
          title: "You Make Me",
          singer: "DAY6",
          image: 'assets/images/a1.jpg',
          url:
              'https://www.mboxdrive.com/You make Me.mp3'),
      itemlist(
          title: "Healer",
          singer: "DAY6",
          image: 'assets/images/a1.jpg',
          url:
              'https://www.mboxdrive.com/Healer.mp3'),
      itemlist(
          title: "둘도 아닌 하나 Only",
          singer: "DAY6",
          image: 'assets/images/a1.jpg',
          url:
              'https://www.mboxdrive.com/둘도 아닌 하나 Only.mp3'),
      itemlist(
          title: "구름 위에서 above the clouds",
          singer: "DAY6",
          image: 'assets/images/a1.jpg',
          url:
              'https://www.mboxdrive.com/구름 위에서 above the clouds.mp3'),
      itemlist(
          title: "무적 ONE",
          singer: "DAY6",
          image: 'assets/images/a1.jpg',
          url:
              'https://www.mboxdrive.com/무적 (ONE).mp3'),
      itemlist(
          title: "우리 앞으로 더 사랑하자 so let's love",
          singer: "DAY6",
          image: 'assets/images/a1.jpg',
          url:
              "https://www.mboxdrive.com/우리 앞으로 더 사랑하자 so let's love.mp3"),
      itemlist(
          title: "Deep in Love",
          singer: "DAY6",
          image: 'assets/images/en.jpg',
          url:
              'https://www.mboxdrive.com/[THAISUB] DAY6 (데이식스) - Deep In Love.mp3'),
      itemlist(
          title: "Sweet Chaos",
          singer: "DAY6",
          image: 'assets/images/en.jpg',
          url:
              'https://www.mboxdrive.com/[THAISUB] DAY6 (데이식스) - Sweet Chaos.mp3'),
      itemlist(
          title: "Emergency",
          singer: "DAY6",
          image: 'assets/images/en.jpg',
          url:
              'https://www.mboxdrive.com/[THAISUB] DAY6 (데이식스) - Emergency.mp3'),
      itemlist(
          title: "Rescue Me",
          singer: "DAY6",
          image: 'assets/images/en.jpg',
          url:
              'https://www.mboxdrive.com/[THAISUB] DAY6 (데이식스) - Rescue Me.mp3'),

    ];
  }

  void initState() {
    items = getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/day6_1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.black87,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: getList().length,
                      itemBuilder: (context, index) => customListView(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(listMusic: items[index])),
                              );
                            },
                            title: items[index].title,
                            singer: items[index].singer,
                            image: items[index].image,
                          )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
