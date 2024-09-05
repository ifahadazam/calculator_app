import 'package:calculator/widgets/calculator.dart';
import 'package:calculator/widgets/history.dart';
import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:animate_do/animate_do.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AnimateIconController c1;
  @override
  void initState() {
    c1 = AnimateIconController();
    super.initState();
  }

  int pageIndex = 0;
  Widget pageWidget() {
    if (pageIndex == 0) {
      return FadeIn(
        duration: const Duration(milliseconds: 1500),
        animate: true,
        child: const Calculator(),
      );
    } else {
      return FadeInLeft(
        duration: const Duration(milliseconds: 600),
        animate: true,
        child: const History(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffCDE4F1),
        // appBar: AppBar(
        //   backgroundColor: Colors.blue[100],
        //   title: const Text(
        //     'Calculator',
        //     style: TextStyle(
        //         color: Color(0xff053B5D),
        //         fontSize: 28,
        //         fontWeight: FontWeight.bold),
        //   ),
        //   centerTitle: true,
        // ),
        bottomNavigationBar: Padding(
<<<<<<< HEAD
          padding: const EdgeInsets.only(bottom: 12, right: 20, left: 20),
=======
          padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
>>>>>>> main
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff306688),
            ),
            height: MediaQuery.sizeOf(context).height * 0.08,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimateIcons(
                    startIcon: Icons.calculate,
                    endIcon: Icons.calculate,
                    controller: c1,
                    size: pageIndex == 1 ? 25 : 35.0,
                    startIconColor: Colors.white,
                    endIconColor: Colors.white,
                    onEndIconPress: () {
                      setState(() {
                        pageIndex = 0;
                      });
                      return true;
                    },
                    onStartIconPress: () {
                      setState(() {
                        pageIndex = 0;
                      });
                      return true;
                    },
                  ),
                  // const Icon(
                  //     Icons.calculate_outlined,
                  //     color: Colors.white,
                  //     size: 35,
                  //   ),

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                  ),
                  AnimateIcons(
                    startIcon: Icons.history,
                    endIcon: Icons.history,
                    controller: c1,
                    size: pageIndex == 0 ? 25 : 35.0,
                    startIconColor: Colors.white,
                    endIconColor: Colors.white,
                    onEndIconPress: () {
                      setState(() {
                        pageIndex = 1;
                      });
                      return true;
                    },
                    onStartIconPress: () {
                      setState(() {
                        pageIndex = 1;
                      });
                      return true;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        body: FadeInUp(
          duration: const Duration(milliseconds: 1200),
          animate: true,
          child: pageWidget(),
        ),
      ),
    );
  }
}
