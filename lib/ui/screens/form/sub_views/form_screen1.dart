import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../utils/data_helper.dart';
import '../../../../utils/date_formatter.dart';
import '../../../../utils/nigerian_states_and_lga.dart';
import '../../../../utils/split_helper.dart';
import '../../../layout/widgets/custom_textfieldX.dart';
import '../../../responsive.dart';
import '../../../styles/styles.dart';
import '../../../widgets/drop_down_field.dart';
import '../../../widgets/row_column.dart';
import '../../main_screen/view_model/main_screen_view_model.dart';

class FormScreen1 extends ViewModelWidget<MainScreenViewModel> {
  const FormScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personal Data',
          style: Styles.defaultTitleText,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 32),
          child: Text('Specify exactly as in your legal documents.',
              style: subBodyStyle.copyWith(
                  fontSize: Responsive.isMobile(context) ? 8.14 : 12,
                  color: Colors.grey.shade400)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: CustomTextFieldX(
            labelText: 'Full Name',
            initialText:
                SplitHelper.getFullName(value: viewModel.currentUser!.id),
            controller: viewModel.fullName,
            isEditable: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: RowColumn(
            vertAxis: Responsive.isMobile(context),
            children: [
              DropDownField(
                labelText: 'Gender',
                values: genders,
                selection: viewModel.currentUser?.gender,
                isEditable: false,
                onChanged: (int index) {
                  viewModel.gender = genders[index];
                },
              ),
              DropDownField(
                labelText: 'Marital Status',
                values: maritalStatuses,
                isEditable: true,
                selection: viewModel.currentUser?.maritalStatus,
                onChanged: (int index) {
                  viewModel.maritalStatus = maritalStatuses[index];
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: RowColumn(
            vertAxis: Responsive.isMobile(context),
            children: [
              GestureDetector(
                onTap: () {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime(1920),
                      lastDate: DateTime(2014),
                      initialDate: DateTime(1995),
                      builder: (BuildContext context, Widget? child) {
                        return Center(
                            child: SizedBox(
                          width: 400.0,
                          height: 500.0,
                          child: child,
                        ));
                      }).then((date) {
                    viewModel.dateOfBirth = date;
                  });
                },
                child: AbsorbPointer(
                  absorbing: true,
                  child: CustomTextFieldX(
                    initialText: DateFormatter.dateFormatter(
                      viewModel.currentUser!.dateOfBirth!,
                    ),
                    labelText: "Date of Birth",
                    isEditable: false,
                    controller: viewModel.dob,
                  ),
                ),
              ),
              CustomTextFieldX(
                labelText: 'Home Town',
                controller: viewModel.homeTown,
                isEditable: false,
                initialText: viewModel.currentUser?.homeTown,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: RowColumn(
            vertAxis: Responsive.isMobile(context),
            children: [
              // DropDownField(
              //   labelText: 'State of Origin',
              //   isEditable: false,
              //   selection: viewModel.currentUser?.stateOfOrigin,
              //   values: NigerianStatesAndLGA.allStates,
              //   onChanged: (int index) {
              //     viewModel.stateOfOrigin =
              //         NigerianStatesAndLGA.allStates[index];
              //   },
              // ),
              // DropDownField(
              //   labelText: 'Local Government of Origin',
              //   isEditable: false,
              //   selection: viewModel.currentUser?.localGovernmentOfOrigin,
              //   values:
              //       NigerianStatesAndLGA.getStateLGAs(viewModel.stateOfOrigin),
              //   onChanged: (int index) {
              //     viewModel.lGAofOrigin = NigerianStatesAndLGA.getStateLGAs(
              //         viewModel.stateOfOrigin)[index];
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

// class ExpandableSingleChildScrollview extends StatelessWidget {
//   final Widget child;
//   const ExpandableSingleChildScrollview({
//     Key? key,
//     required this.child,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return SingleChildScrollView(
//           child: ConstrainedBox(
//             constraints: BoxConstraints(minHeight: constraints.maxHeight),
//             child: IntrinsicHeight(
//               child: child,
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
