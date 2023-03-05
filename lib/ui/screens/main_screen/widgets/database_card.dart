import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app_setup.locator.dart';
import '../../../../app/app_setup.router.dart';
import '../../../../utils/split_helper.dart';
import '../../../styles/styles.dart';
import '../../../widgets/buttons/base_button.dart';
import '../../../widgets/dp_widget.dart';
import '../view_model/main_screen_view_model.dart';
import 'data_row_widget.dart';

class DatabaseCard extends ViewModelWidget<MainScreenViewModel> {
  const DatabaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(height: 25),
          OADpImageWidget(
            imageUrl: model.currentUser!.imageUrl,
            placeholderAsset: 'assets/em.png',
            height: 115,
            width: 110,
            isCircular: false,
          ),
          const SizedBox(height: 10),
          Text(SplitHelper.getFullName(value: model.currentUser!.id)),
          const SizedBox(height: 35),
          const Divider(
            thickness: 0.5,
            color: Color(0xffF0F0F0),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DataRowWidget(
                  title1: "Email",
                  desc1: model.currentUser!.email,
                  title2: 'Phone',
                  desc2: model.currentUser!.phoneNumber,
                ),
                DataRowWidget(
                  title1: "Children",
                  desc1: "NIL",
                  title2: 'Age',
                  desc2: SplitHelper.getAge(model.currentUser!.dateOfBirth!),
                ),
                DataRowWidget(
                  title1: "LGA",
                  desc1: model.currentUser!.localGovernment,
                  title2: 'Employment',
                  desc2: model.currentUser!.employmentStatus,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: 205,
                    child: BaseButton(
                      textButton: 'Edit',
                      suffixIcon: Icons.edit,
                      buttonColor: const Color(0xffff5c00),
                      textStyle: databaseStyle4,
                      onPress: () => locator<NavigationService>()
                          .navigateTo(Routes.formScreen),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
