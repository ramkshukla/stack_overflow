import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class RingTone {
  final String title;
  final String uri;

  RingTone({required this.title, required this.uri});
}

class MethodChannelUI extends StatefulWidget {
  const MethodChannelUI({super.key});

  @override
  State<MethodChannelUI> createState() => _MethodChannelState();
}

class _MethodChannelState extends State<MethodChannelUI> {
  String? methodChannel;
  int? batteryLevel;
  List? ringtones;
  AudioPlayer audioPlayer = AudioPlayer();

  static const methodChannelName = MethodChannel("username");
  static const batteryLevelMethodChannel = MethodChannel("batteryLevel");
  static const getRingTonesMethodChannel = MethodChannel("ringToneChannel");
  @override
  void initState() {
    super.initState();
    methodChannel = "Not Initiated";
  }

  Future<void> initUserNameMethodChannel() async {
    String? name = await methodChannelName.invokeMethod<String>("getUserName");
    if (name != null) {
      setState(() {
        methodChannel = name;
      });
    }
  }

  Future<int> initGetBatteryLevel() async {
    try {
      int? value =
          await batteryLevelMethodChannel.invokeMethod<int>("getBatteryLevel");

      setState(() {
        batteryLevel = value;
      });
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
      batteryLevel = -1;
    }
    return batteryLevel!;
  }

  Future<List> getRingTones() async {
    try {
      List ringTones =
          await getRingTonesMethodChannel.invokeMethod("getRingTones");
      print("RingTones: $ringTones");
      setState(() {
        ringtones = ringTones;
      });
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
    }
    return ringtones!;
  }

  void playRingTones(String? ringtone) {
    audioPlayer.setAudioSource(
      AudioSource.uri(Uri.tryParse(ringtone!)!),
    );
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Method Channel")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("User Name: $methodChannel!"),
          Text("Battery Level: $batteryLevel"),
          if ((ringtones ?? []).isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: ringtones!.length,
                itemBuilder: (context, index) {
                  final ringtone = ringtones![index];

                  return Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          playRingTones(ringtone);
                        });
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ringtone_${index + 1}"),
                          Icon(Icons.play_arrow)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ElevatedButton(
            onPressed: initUserNameMethodChannel,
            child: Text("Initiate Method channel"),
          ),
          ElevatedButton(
            onPressed: initGetBatteryLevel,
            child: Text("Fetch Battery Level"),
          ),
          ElevatedButton(onPressed: getRingTones, child: Text("Get RongTones"))
        ],
      ),
    );
  }
}
