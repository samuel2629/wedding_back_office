import 'dart:ui';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_back_office/common/components/colors.dart';
import 'package:wedding_back_office/common/controller/controller_common.dart';
import 'package:wedding_back_office/common/view/profile_picture/profile_picture.dart';
import 'package:wedding_back_office/panel/controller/controller_panel.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> with TickerProviderStateMixin {

  final _controllerPanel = Get.put(PanelController());
  final _controllerCommon = Get.put(CommonController());
  late TabController tabController;
  late int length;

  @override
  void initState() {
    _controllerCommon.retrieveUsers();
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
      body: Obx(() => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/3.jpg"),
              fit: BoxFit.cover,
              opacity: 0.25
            )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildSideBar(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildTabBar(context),
                  buildRowCardsInvites(),
                  buildRepertoireList(context)
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }

  Color returnColorForUserAvatar(int status){
    if(status == 0) {
      return const Color(0xffE9A23B);
    } else if(status == 1) {
      return const Color(0xff5EC269);
    } else if(status == 2) {
      return const Color(0xffDD524C);
    } else {
      return const Color(0xff4E80EE);
    }
  }

  Container buildSideBar() {
    return Container(
      width: 250,
      color: Colors.white.withOpacity(0.5),
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
    );
  }

  SizedBox buildTabBar(BuildContext context) {
    return SizedBox(
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
    );
  }

  Padding buildRowCardsInvites() {
    return Padding(
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
                                  Text(_controllerCommon.users.value?.length.toString() ?? "0", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xff4E80EE)),),
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
                                  Text(_controllerCommon.users.value?.where((element) => element.status == 1).toList().length.toString() ?? "0", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xff5EC269)),),
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
                                child: Text('Awaiting', style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, fontSize: 22),),
                              ),
                              Center(child: Column(
                                children: [
                                  Text(_controllerCommon.users.value?.where((element) => element.status == 0).toList().length.toString() ?? "0", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xffE9A23B)),),
                                  Text("Unknow", style: GoogleFonts.varelaRound(fontSize: 20, fontWeight: FontWeight.normal, color: const Color(0xffE9A23B)),),
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
                                    Text(_controllerCommon.users.value?.where((element) => element.status == 2).toList().length.toString() ?? "0", style: GoogleFonts.varelaRound(fontSize: 54, fontWeight: FontWeight.normal, color: const Color(0xffDD524C)),),
                                    Text("Absent", style: GoogleFonts.varelaRound(fontSize: 20, fontWeight: FontWeight.normal, color: const Color(0xffDD524C)),),
                                  ],
                                ),)
                              ],
                            ),
                          ),
                        )
                    ],),
                  ),
                );
  }


  Widget buildRepertoireList(BuildContext context) {
    SuspensionUtil.sortListBySuspensionTag(_controllerCommon.users.value);
    SuspensionUtil.setShowSuspensionStatus(_controllerCommon.users.value);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Flexible(
          fit: FlexFit.loose,
          child: SafeArea(
            child: AzListView(
              indexBarWidth: 40 ,
              indexBarMargin:
              const EdgeInsets.only(right: 24, top: 24, bottom: 24),
              indexHintBuilder: (context, hint) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: strongColor),
                  alignment: Alignment.center,
                  child: Text(hint,
                      style:
                      GoogleFonts.varelaRound(fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18)
                  ),
                ),
              indexBarItemHeight: MediaQuery.of(context).size.height / 50,
              indexBarOptions: IndexBarOptions(
                  textStyle: GoogleFonts.varelaRound(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF828282).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  downDecoration: BoxDecoration(
                    color: const Color(0xFF828282).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  selectTextStyle:
                  GoogleFonts.varelaRound(
                    color: strongColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ) ,
                  selectItemDecoration: const BoxDecoration(),
                  needRebuild: true,
                  indexHintAlignment: Alignment.centerRight,
                  indexHintOffset: const Offset(0, 0)),
              padding: const EdgeInsets.only(top: 16),
              indexBarData: const [
                'A',
                'B',
                'C',
                'D',
                'E',
                'F',
                'G',
                'H',
                'I',
                'J',
                'K',
                'L',
                'M',
                'N',
                'O',
                'P',
                'Q',
                'R',
                'S',
                'T',
                'U',
                'V',
                'W',
                'X',
                'Y',
                'Z',
              ],
              data: _controllerCommon.users.value ?? [],
              itemCount: _controllerCommon.users.value?.length ?? 0,
              itemBuilder: buildSirklRepertoire,
            ),
          )),
    );
  }

  Widget buildSirklRepertoire(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        index == 0
            ? Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 0),
          child: Text(
            "GUESTS",
            style:
            GoogleFonts.varelaRound(
            color: Colors.black,
            fontWeight: FontWeight.w700,
    fontSize: 18
            )
          ),
        )
            : Container(),
        Offstage(
          offstage: !_controllerCommon.users.value![index].isShowSuspension,
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 92, top: index == 0 ? 16 : 48),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  _controllerCommon.users.value![index].nom![0].toUpperCase(),
                  softWrap: false,
                  style:
                  GoogleFonts.varelaRound(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                  )
                ),
                const Expanded(
                    child: Divider(
                      color: Color(0xFF828282),
                      height: 2,
                      indent: 10.0,
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              !_controllerCommon.users.value![index].isShowSuspension
                  ? Divider(
                  color: MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? const Color(0xFF9BA0A5)
                      : const Color(0xFF828282),
                  indent: 84,
                  endIndent: 96,
                  thickness: 0.1)
                  : Container(),
              _controllerCommon.users.value![index].isShowSuspension
                  ? const SizedBox(
                height: 24,
              )
                  : const SizedBox(height: 8,),
              ListTile(
                leading: ProfilePicture(radius: 31, name: _controllerCommon.users.value?[index].nom ?? "", fontsize: 16, color: returnColorForUserAvatar(_controllerCommon.users.value![index].status!)),
                title: Text(_controllerCommon.users.value?[index].nom ?? "", style: GoogleFonts.varelaRound(),),
              ),
            ],
          ),
        ),
      ],
    );
  }



}
