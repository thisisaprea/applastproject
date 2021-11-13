import 'package:audioplayers/audioplayers.dart';
import 'package:day6/models/music_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.listMusic}) : super(key: key);
  final itemlist listMusic;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isBack = false;
  IconData btnIcon = Icons.play_arrow;
  var bgColor = const Color(0xFF212121);
  var iconHoverColor = const Color(0xFF1B5E20);

  Duration duration = new Duration();
  Duration position = new Duration();

  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
          //from now we hear song
        });
      }
    }

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 500.0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.listMusic.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [bgColor.withOpacity(0.4), bgColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 52.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: InkWell(
                                  onTap: _handleClickButton,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'PLAYLIST',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  Text('Best Performance Band',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Icon(
                                Icons.playlist_add,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Spacer(),
                          Text(widget.listMusic.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0)),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            widget.listMusic.singer,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 18.0),
                          ),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 42.0,
              ),
              Slider.adaptive(
                value: position.inSeconds.toDouble(),
                min: 0.0,
                max: duration.inSeconds.toDouble() + 1.0,
                activeColor: Color(0xFF1B5E20),
                inactiveColor: Colors.black54,
                onChanged: (value) {},
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.fast_rewind,
                    color: Colors.white54,
                    size: 42.0,
                  ),
                  SizedBox(width: 32.0),
                  Container(
                    decoration: BoxDecoration(
                        color: iconHoverColor,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            playMusic(widget.listMusic.url);
                            if (isPlaying) {
                              isPlaying = false;
                              audioPlayer.pause();
                              setState(() {
                                btnIcon = Icons.play_arrow;
                              });
                            } else {
                              isPlaying = true;
                              audioPlayer.resume();
                              setState(() {
                                btnIcon = Icons.pause;
                              });
                            }
                          },
                          iconSize: 42.0,
                          icon: Icon(btnIcon),
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(width: 32.0),
                  Icon(
                    Icons.fast_forward,
                    color: Colors.white54,
                    size: 42.0,
                  ),
                ],
              ),
              Spacer(),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  _handleClickButton() {
    isBack = true;
    if (isBack == true) {
      Navigator.pushReplacementNamed(context, '/PlayList');
    } else {
      SizedBox.shrink();
    }
  }
}
