import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app_setup.router.dart';
import '../responsive.dart';
import '../../app/app_setup.locator.dart';
import '../../core/models/enums/navigation_items.dart';
import '../screens/main_screen/view_model/main_screen_view_model.dart';
import 'widgets/navigation_button.dart';

class NavigationPanel extends StatelessWidget {
  final Axis axis;
  // int activeTab = 0;

  const NavigationPanel({Key? key, required this.axis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.reactive(
        viewModelBuilder: () => locator<MainScreenViewModel>(),
        disposeViewModel: false,
        builder: (context, model, _) {
          return Container(
            constraints: BoxConstraints(
              minWidth: 80,
              maxWidth: context.resValues(
                  100, 100, MediaQuery.of(context).size.width)!,
              maxHeight: context.resValues(MediaQuery.of(context).size.height,
                  MediaQuery.of(context).size.height, 100)!,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: Responsive.isDesktop(context)
                ? const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                : const EdgeInsets.all(10),
            child: axis == Axis.vertical
                ? Column(
                    children: [
                      Expanded(
                          child:
                              Image.asset('assets/ondo_logo.png', height: 50)),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              navModel.length,
                              (index) => NavigationButton(
                                    onPressed: () {
                                      model.changePage(index);
                                      if (index == 1) {
                                        locator<NavigationService>()
                                            .navigateTo(Routes.formScreen);
                                      } else {
                                        locator<NavigationService>()
                                            .navigateTo(Routes.mainScreen);
                                      }
                                    },
                                    icon: navModel[index].icon,
                                    isActive: index == model.pageIndex,
                                  )),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset('assets/ondo_logo.png', height: 20),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: NavigationItems.values
                              .map(
                                (e) => NavigationButton(
                                  onPressed: () {
                                    model.changePage(e.index);
                                    if (e.index == 1) {
                                      locator<NavigationService>()
                                          .navigateTo(Routes.formScreen);
                                    } else {
                                      locator<NavigationService>()
                                          .navigateTo(Routes.mainScreen);
                                    }
                                  },
                                  icon: e.icon,
                                  isActive: e.index == model.pageIndex,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
