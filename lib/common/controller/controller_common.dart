import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wedding_back_office/common/model/invite_dto.dart';

class CommonController extends GetxController{

  Rx<List<Invite>?> users = (null as List<Invite>?).obs;


  retrieveUsers() async {
    var init = FirebaseFirestore.instance.collection("invites").withConverter(fromFirestore: Invite.fromFirestore,
      toFirestore: (Invite invite, _) => invite.toFirestore(),);
    var retrieve = await init.get();
    var d = retrieve.docs.map((e) => e.data()).toList();
    users.value = retrieve.docs.map((e) => e.data()).toList();
  }

}