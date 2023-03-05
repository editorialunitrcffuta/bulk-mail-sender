import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../styles/styles.dart';
import '../../main_screen/view_model/main_screen_view_model.dart';

class FormHeaderWidget extends ViewModelWidget<MainScreenViewModel> {
  const FormHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => viewModel.onClose(),
          child: Icon(
            Icons.arrow_back,
            color: Styles.defaultDesignColor,
            size: 34,
          ),
        ),
        Row(
          children: [
            IndexBox(
                isActive: viewModel.formIndex == 0 ||
                    viewModel.formIndex == 1 ||
                    viewModel.formIndex == 2),
            SizedBox(
                width: 40,
                child: Divider(
                  color: viewModel.formIndex == 1 || viewModel.formIndex == 2
                      ? Styles.defaultDesignColor
                      : Styles.defaultLightGreyColor,
                )),
            IndexBox(
              isActive: viewModel.formIndex == 1 || viewModel.formIndex == 2,
            ),
            SizedBox(
                width: 40,
                child: Divider(
                  color: viewModel.formIndex == 2
                      ? Styles.defaultDesignColor
                      : Styles.defaultLightGreyColor,
                )),
            IndexBox(isActive: viewModel.formIndex == 2),
          ],
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}

class IndexBox extends StatelessWidget {
  final bool isActive;

  const IndexBox({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          color: isActive ? Styles.defaultDesignColor : const Color(0xFFB9B9C3),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
