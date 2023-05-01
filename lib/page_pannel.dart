import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:wedding_back_office/components/colors.dart';
import 'package:wedding_back_office/controller_panel.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> with TickerProviderStateMixin {

  final _controllerPanel = Get.put(PanelController());
  late TabController tabController;
  late int length;

  @override
  void initState() {
    length = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    tabController = TabController(length: length, vsync: this);
    tabController.index = _controllerPanel.index.value;
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        _controllerPanel.index.value = tabController.index;
      }
    });

    return Scaffold(
      //backgroundColor: lightColor.withOpacity(0.05),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/3.jpg"),
              fit: BoxFit.cover,
            )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 250,
                color: Colors.white.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(-0, -36),
                        child: Image.asset("assets/images/logo.png")),
                    Transform.translate(
                      offset: const Offset(0, -68),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 36.0),
                        child: Text("MAIN MENU", style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -54),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 36.0),
                        child: Row(children: [
                          Icon(Icons.person_outline_rounded, size: 20, color: Colors.black.withOpacity(0.75),),
                          const SizedBox(width: 4),
                          Text("Guests' List", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.75), fontSize: 16),)
                        ],),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 36.0),
                        child: Row(children: [
                          Icon(Icons.table_bar_outlined, size: 20, color: Colors.black.withOpacity(0.75),),
                          const SizedBox(width: 4),
                          Text("Tables Organization", style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.75), fontSize: 16),)
                        ],),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -28),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 36.0),
                        child: Row(children: [
                          Icon(Icons.notifications_none_outlined, size: 20, color: Colors.black.withOpacity(0.75),),
                          const SizedBox(width: 4),
                          Text("Notifications", style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.75), fontSize: 16),)
                        ],),
                      ),
                    ),
                    const SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 36.0),
                      child: Text("SETTINGS", style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),),
                    ),
                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 36.0),
                      child: Row(children: [
                        Icon(Icons.edit_rounded, size: 20, color: Colors.black.withOpacity(0.75),),
                        const SizedBox(width: 4),
                        Text("Account", style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.75), fontSize: 16),)
                      ],),
                    ),
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.only(left: 36.0),
                      child: Row(children: [
                        Icon(Icons.logout_rounded, size: 20, color: Colors.black.withOpacity(0.75),),
                        const SizedBox(width: 4),
                        Text("Log out", style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.75), fontSize: 16),)
                      ],),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text("License Joan & Samuel 2023-2024", style: GoogleFonts.varelaRound(fontSize: 12),),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      color: Colors.transparent,
                      child: TabBar(
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(width: 1),
                            insets: EdgeInsets.symmetric(horizontal: 24),
                          ),
                          labelPadding: const EdgeInsets.only(bottom: 12),
                          controller: tabController,
                          isScrollable: true,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          unselectedLabelColor: Colors.black.withOpacity(0.5),
                          labelColor: Colors.black.withOpacity(0.75),
                          overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                          tabs: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
                              child: Text("Mariage", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                            ), Padding(
                              padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
                              child: Text("Shabbat",  style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                            )]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          color: Colors.white,
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0, top: 24, bottom: 12),
                                  child: Text('Total', style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, fontSize: 22),),
                                ),
                                Center(child: Column(
                                  children: [
                                    Text("450", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xff4E80EE)),),
                                    Text("Guests", style: GoogleFonts.varelaRound(fontSize: 20, fontWeight: FontWeight.normal, color: const Color(0xff4E80EE)),),
                                  ],
                                ),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          color: Colors.white,
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0, top: 24, bottom: 12),
                                  child: Text('Coming', style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, fontSize: 22),),
                                ),
                                Center(child: Column(
                                  children: [
                                    Text("213", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xff5EC269)),),
                                    Text("Accepted", style: GoogleFonts.varelaRound(fontSize: 20, fontWeight: FontWeight.normal, color: const Color(0xff5EC269)),),
                                  ],
                                ),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          color: Colors.white,
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0, top: 24, bottom: 12),
                                  child: Text('Unknown', style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, fontSize: 22),),
                                ),
                                Center(child: Column(
                                  children: [
                                    Text("127", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xffE9A23B)),),
                                    Text("Awaiting", style: GoogleFonts.varelaRound(fontSize: 20, fontWeight: FontWeight.normal, color: const Color(0xffE9A23B)),),
                                  ],
                                ),)
                              ],
                            ),
                          ),
                        ),
                          const SizedBox(width: 16,),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            color: Colors.white,
                            child: SizedBox(
                              width: 300,
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0, top: 24, bottom: 12),
                                    child: Text('Not Coming', style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, fontSize: 22),),
                                  ),
                                  Center(child: Column(
                                    children: [
                                      Text("253", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xffDD524C)),),
                                      Text("Missings", style: GoogleFonts.varelaRound(fontSize: 20, fontWeight: FontWeight.normal, color: const Color(0xffDD524C)),),
                                    ],
                                  ),)
                                ],
                              ),
                            ),
                          )
                      ],),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  buildXt(){
    SidebarX(
      extendedTheme: SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: strongColor,
          ),
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(16),
          textStyle: const TextStyle(color: Colors.black)
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {return SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Image.asset('assets/images/white_logo.png', color: Colors.white,),
        ),
      );},
      headerDivider: Padding(
        padding: const EdgeInsets.only(bottom: 24.0, top: 8),
        child: divider,
      ),
      theme: SidebarXTheme(
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: strongColor,
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(color: Colors.white),
          selectedTextStyle: const TextStyle(color: Colors.white),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
              border: Border.all(color: lightColor),
              borderRadius: BorderRadius.circular(10)
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: lightColor,
          ),
          padding: const EdgeInsets.all(8)),
      controller: SidebarXController(selectedIndex: 0),
      items: [
        SidebarXItem(label: "Home", iconWidget: Icon(Icons.home_rounded, color: strongColor,)),
        const SidebarXItem(icon: Icons.person_rounded, label: "Profile")
      ],);
  }
}

final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);