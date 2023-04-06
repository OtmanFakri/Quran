import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../Controllors/Controllor_surahs.dart';
class Deatils extends GetView<Controllor_surahs> {
  const Deatils({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child:Image.asset('lib/Assets/bg.jpg',fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sura(context),
                Text(controller.PostsSura[0].data.name),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(30),
                  topStart: Radius.circular(30),
                )
              ),
              child: Row(
                children: [
                  IconButton(onPressed: ()async{

                    controller.player.play();

                    await controller.player.setAudioSource(controller.start() ,
                        initialIndex: 0, initialPosition: Duration.zero);
                    controller.player.currentIndexStream.listen((state) async {
                      controller.updateAya(state!);
                      controller.player.playerStateStream.listen((state) {
                        if(state.processingState == ProcessingState.completed){
                          controller.currentSura=0;
                        }
                      });
                      (context as Element).markNeedsBuild();
                    });
                    controller.currentSura=0;
                    // Play without waiting for completion
                  }, icon: Icon(Icons.play_arrow)),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }

   sura(BuildContext context)  {

    (context as Element).markNeedsBuild();
    return Text(controller.PostsSura[0].data.ayahs[controller.currentSura].text,textAlign: TextAlign.center,);


  }
}
