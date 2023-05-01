import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wedding_back_office/components/colors.dart';
import 'package:wedding_back_office/login/controller/controller_login.dart';
import 'package:wedding_back_office/page_pannel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _controllerLogin = Get.put(LoginController());
  final _passwordTextEditingController = TextEditingController();
  final _usernameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Obx(() =>Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/3.jpg"),
                fit: BoxFit.cover,
              )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12,),
                    Transform.translate(
                      offset: const Offset(-16, 60),
                      child: Image.asset('assets/images/logo.png', width: 400, height: 400,),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                      width: 400,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(child: Text("Login", textAlign: TextAlign.center, style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold, fontSize: 16),)),
                          const SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 48.0),
                            child: Align(alignment: Alignment.center,child: Text("Welcome to your personal space dear bride and groom", textAlign: TextAlign.center, style: GoogleFonts.varelaRound(fontWeight: FontWeight.normal, fontSize: 14),)),
                          ),
                          const SizedBox(height: 16,),
                          TextField(
                            controller: _usernameTextEditingController,
                            style: GoogleFonts.varelaRound(),
                            cursorColor: Colors.black,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                                hintStyle: GoogleFonts.varelaRound(fontSize: 14),
                                hintText: 'Username',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: const Color(0xff2F5233).withOpacity(0.85), width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                          ),
                          const SizedBox(height: 8,),
                          TextField(
                            controller: _passwordTextEditingController,
                            style: GoogleFonts.varelaRound(fontSize: 14),
                            cursorColor: Colors.black,
                            obscureText: _controllerLogin.obscureText.value,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: (){
                                  _controllerLogin.obscureText.value = !_controllerLogin.obscureText.value;
                                }, icon: Icon(_controllerLogin.obscureText.value ? Icons.visibility_off_rounded : Icons.visibility_rounded, color: Colors.black, size: 18,),),
                                hintStyle: GoogleFonts.varelaRound(),
                                hintText: 'Password',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder:OutlineInputBorder(
                                  borderSide: BorderSide(color: strongColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                          ),
                          const SizedBox(height: 36,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: strongColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: (){
                                Get.off(const PanelPage());
                              }, child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            width: 100,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Continue", style: GoogleFonts.varelaRound(fontWeight: FontWeight.bold),),
                                const Icon(Icons.arrow_forward_rounded, size: 18,)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ))
    );
  }
}
