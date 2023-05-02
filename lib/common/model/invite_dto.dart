import 'package:cloud_firestore/cloud_firestore.dart';

class Invite {
  final String? nom;
  final bool? admin;
  final int? table;
  final int? status;
  final bool? shabbat;

  Invite({
    this.nom,
    this.admin,
    this.table,
    this.status,
    this.shabbat
  });

  factory Invite.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Invite(
      nom: data?['Nom'],
      admin: data?['Admin'],
      table: data?['Table'],
      status: data?['Status'],
      shabbat: data?['Shabbat']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nom != null) "Nom": nom,
      if (admin != null) "Admin": admin,
      if (table != null) "Table": table,
      if (status != null) "Status": status,
      if (shabbat != null) "Shabbat": shabbat
    };
  }
}