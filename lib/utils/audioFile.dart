// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioFile extends StatefulWidget {
  AudioPlayer advancedPlayer;
  AudioFile({Key? key, required this.advancedPlayer,}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
   Duration _position = new Duration();
   final String localFilePath = "audio/epic.mp3";
   bool isPlaying = false;
   bool isPaused = false;
   bool isLoop = false;
   bool isRepeat = false;
  Color color = Colors.black;
   List<IconData> _icons = [
     Icons.play_circle_fill,
     Icons.pause
   ];

   @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });

    this.widget.advancedPlayer.setUrl(Get.arguments["audio"]);
    this.widget.advancedPlayer.setVolume(1);
    this.widget.advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        isPlaying = false;
        if(isRepeat = true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      onPressed: () {
        if(isPlaying == false) {
          this.widget.advancedPlayer.play(Get.arguments["audio"]);
          setState(() {
            isPlaying = true;
          });
        } else if(isPlaying == true) {
          this.widget.advancedPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      }, 
      icon: isPlaying == false ? Icon(_icons[0], size: 40, color: Colors.white,) : Icon(_icons[1], size: 40, color: Colors.orange,),
      padding: EdgeInsets.only(bottom: 10),
    );
  }

  Widget btnSlow() {
    return IconButton(
      onPressed: () {
        widget.advancedPlayer.setPlaybackRate(0.5);
      }, 
      icon: Icon(Icons.arrow_back),
      iconSize: 15,
      color: Colors.black,
    );
  }

  Widget btnFast() {
    return IconButton(
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate(1.5);
      }, 
      icon: Icon(Icons.forward),
      iconSize: 15,
      color: Colors.black,
    );
  }

    Widget btnLoop() {
    return IconButton(
      onPressed: () {
        
      }, 
      icon: Icon(Icons.loop),
      iconSize: 15,
      color: Colors.black,
    );
  }

    Widget btnRepeat() {
    return IconButton(
      onPressed: () {
        if(isRepeat == false) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat = true;
            color: Colors.blue;
          });
        } else if(isRepeat == true) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
          setState(() {
            isRepeat = false;
            color: Colors.black;
          });
        }
      }, 
      icon: Icon(Icons.repeat),
      iconSize: 15,
      color: Colors.black,
    );
  }

  Widget slider() {
    return Slider(
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });});
  }

  changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.advancedPlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop(),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split(".")[0],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  _duration.toString().split(".")[0],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          slider(),
          SizedBox(height: 5,),
          loadAsset()
        ],
      ),
    );
  }
}