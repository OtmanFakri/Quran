import 'dart:math';

import 'package:get/get.dart';

import '../Models/surahs.dart';
import '../Services/Service_surahs.dart';
import 'package:just_audio/just_audio.dart';

class Controllor_surahs extends GetxController with StateMixin{


  Service_Surahs service_Surahs =Service_Surahs();
  //
  RxList<dynamic> Posts=[].obs;
  late RxList<dynamic> PostsSura=[].obs;
  //
  RxInt Selected=0.obs;
  //
  int currentSura=0;
  final player = AudioPlayer();
  //RxInt indexaya=0.obs;
  @override
  void onInit() {

    dataSurahs();


  }
  //
  dataSurahs()async{
    await service_Surahs.getPost().then((value) {
      Posts.addAll(value);
      change(Posts, status: RxStatus.success());

      //update();
    });
  }
  //
  dataSura(int id)async{
    await service_Surahs.getDetail(id).then((value) {
      PostsSura.clear();
      PostsSura.addAll(value);
      change(PostsSura, status: RxStatus.success());
      //update();

    });
  }
  //

  final List<AudioSource> myTest=[];// Define the playlist

  start(){
    myTest.clear();
    for(var i in PostsSura[0].data.ayahs) {
      myTest.add(
        AudioSource.uri(Uri.parse(
            "https://cdn.islamic.network/quran/audio/128/ar.alafasy/"+i.number.toString()+".mp3")),
      );
    }
    return ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: true,
      // Customise the shuffle algorithm
      shuffleOrder: DefaultShuffleOrder(),
      // Specify the playlist items
      children: myTest,
    );
  }

  updateAya(int state){
    currentSura=state;
    update();
  }

}
