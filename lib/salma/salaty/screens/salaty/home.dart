import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/pray_model.dart';

class SalatyHomePage extends StatefulWidget {
  const SalatyHomePage({super.key});

  @override
  State<SalatyHomePage> createState() => _SalatyHomePageState();
}

class _SalatyHomePageState extends State<SalatyHomePage> {
  List<PrayModel> prays = [
    PrayModel(
      title: "Fajr",
      time: "04:08 am",
      icon: "lib/salma/assets/fajr.png",
      isMuted: false,
      isSelected: true,
    ),
    PrayModel(
      title: "Sunrise",
      time: "05:53 am",
      icon: "lib/salma/assets/sunrise.png",
      isMuted: true,
      isSelected: false,
    ),
    PrayModel(
      title: "Dhuhr",
      time: "12:54 pm",
      icon: "lib/salma/assets/dhuhr.png",
      isMuted: false,
      isSelected: true,
    ),
    PrayModel(
      title: "Asr",
      time: "04:30 pm",
      icon: "lib/salma/assets/asr.png",
      isMuted: false,
      isSelected: true,
    ),
    PrayModel(
      title: "Maghrib",
      time: "07:55 pm",
      icon: "lib/salma/assets/sunset.png",
      isMuted: false,
      isSelected: true,
    ),
    PrayModel(
      title: "Isha",
      time: "09:27 am",
      icon: "lib/salma/assets/isha.png",
      isMuted: false,
      isSelected: true,
    ),
  ];

  int dateDuration = 0;

  late final Timer _timer;

  void _refresh() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_history,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Giza",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        actions: [
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.black26,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.black26,
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.black26,
            child: Icon(
              Icons.notification_add_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: .3,
              child: Image.asset(
                "assets/instagram/background.png",
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text(
                  "Dhuhr",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text(
                      "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " AM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Next prayer in ${DateTime.now().toString().substring(10, 19)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green.shade900,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    dateDuration++;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  padding: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Text(
                                  DateTime.now()
                                      .subtract(Duration(days: dateDuration))
                                      .toString()
                                      .substring(0, 10),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    dateDuration--;
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) =>
                                  SalatyItem(prays[index]),
                              separatorBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.green.shade800,
                                ),
                              ),
                              itemCount: prays.length,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SalatyItem extends StatefulWidget {
  const SalatyItem(this.pray, {super.key});

  final PrayModel pray;

  @override
  State<SalatyItem> createState() => _SalatyItemState();
}

class _SalatyItemState extends State<SalatyItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Image.asset(
          widget.pray.icon,
          height: 25,
          width: 25,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          widget.pray.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            widget.pray.isMuted = !widget.pray.isMuted;
            setState(() {});
          },
          child: Icon(
            widget.pray.isMuted
                ? CupertinoIcons.speaker_slash
                : CupertinoIcons.speaker_2,
            color: Colors.green,
            size: 20,
          ),
        ),
        const Spacer(),
        Text(
          widget.pray.time,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Checkbox(
          activeColor: Colors.green,
          checkColor: Colors.black,
          value: widget.pray.isSelected,
          onChanged: (state) {
            widget.pray.isSelected = !widget.pray.isSelected;
            setState(() {});
          },
        ),
      ],
    );
  }
}
