import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllors/Controllor_surahs.dart';
import '../Views/Details.dart';

class ListSurahs extends GetView<Controllor_surahs> {
  const ListSurahs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.obx(
            (state)=>Listsurahs(),
        onLoading: CircularProgressIndicator(),
        onEmpty: Text('No data found'),

        onError: (error)=>Text(error!),
      ),
    );

  }

  Widget Listsurahs() {
    return ListView.builder(
        itemCount: 114,
        itemBuilder: (context,index){
      return Column(
        children: controller.Posts.map((e) {
          return Padding(padding: EdgeInsets.only(right: 50,left: 50),
          child: InkWell(
            onTap: () async{
              controller.Selected = index.obs;
              (context as Element).markNeedsBuild();
              await controller.dataSura(index+1);
              Get.to(()=>Deatils(),transition:Transition.rightToLeft);

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e.datas!.surahs!.references![index].name.toString()),
                //Icons.bookmark_border,size: 30
                Icon(controller.Selected == index ? Icons.bookmark_border : Icons.add),
              ],
            ),
          ),);
        }).toList(),
      );
    });
  }
}
