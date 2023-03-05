import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app_setup.locator.dart';
import '../../app/app_setup.logger.dart';
import '../../app/app_setup.router.dart';
import '../responsive.dart';
import '../styles/styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  final _log = getLogger((WelcomeScreen).toString());
  AnimationController? _animationController;
  Animation? _growAnimation;
  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..addListener(() {
            setState(() {
              if (_growAnimation?.value > 28) {
                _animationController?.reverse();
              } else {
                // _animationController?.forward();
              }
              if (_growAnimation?.value == 0) {
                _animationController?.forward();
              }
            });
          });
    _growAnimation = Tween<double>(begin: 0.0, end: 30.0)
        .animate(_animationController!.view);
    _animationController?.forward();
    super.initState();

    // FirebaseFirestore.instance.collection('Widows').doc('r9wPCl0L4phtattTDxbJ').get().then((value) => _log.i("Widow: ${value.data()}"));
    // DataImportService().importTeachersData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragDown: (dragDownDetails) {
          locator<NavigationService>().navigateTo(Routes.adminLoginScreen);
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         ctx: context,
          //         type: PageTransitionType.bottomToTop,
          //         duration: const Duration(milliseconds: 3000),
          //         reverseDuration: const Duration(milliseconds: 2000),
          //         child: const MainScreen()));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/ondo_widow.png',
                    ),
                    fit: BoxFit.cover,
                  )),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WelcomeTexts(),
                  SizedBox(
                    height: 220,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 40,
                        bottom: _growAnimation?.value + 40,
                      ),
                      child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Swipe', style: swipeStyle),
                              const Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(Icons.double_arrow_rounded,
                                      size: 40, color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                      // )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeTexts extends StatelessWidget {
  const WelcomeTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/stacked_image.png',
          height: Responsive.isMobile(context) ? 33 : 48.49,
          width: Responsive.isMobile(context) ? 154 : 224.38,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 10),
          child: Text('ONDO',
              style: Responsive.isMobile(context)
                  ? welcomeStyle1.copyWith(fontSize: 52)
                  : welcomeStyle1),
        ),
        Text(
          'At-Risk Children Project',
          textAlign: TextAlign.center,
          style: Responsive.isMobile(context)
              ? welcomeStyle2.copyWith(fontSize: 24)
              : Responsive.isTablet(context)
                  ? welcomeStyle2.copyWith(fontSize: 48)
                  : welcomeStyle2,
        ),
        SizedBox(
            width: Responsive.isMobile(context)
                ? 239
                : Responsive.isTablet(context)
                    ? 400
                    : 618,
            child: Divider(color: Styles.defaultLightWhiteColor)),
      ],
    );
  }
}
