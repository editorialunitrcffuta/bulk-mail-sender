import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../responsive.dart';
import '../../../styles/styles.dart';
import '../../main_screen/view_model/main_screen_view_model.dart';

class FormSubmitButton extends ViewModelWidget<MainScreenViewModel> {
  const FormSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,viewModel) {
    return SizedBox(
      width: Responsive.isMobile(context)
          ? 83.69
          : 124,
      height: Responsive.isMobile(context)
          ? 32.56
          : 48,
      child: MaterialButton(
        color: Styles.defaultDesignColor,
        onPressed: viewModel.submit, //todo:
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            if (!viewModel.isBusy)
              Text("Submit",
                  style: subBodyStyle.copyWith(
                      fontSize: Responsive
                          .isMobile(
                          context)
                          ? 10.2
                          : 16,
                      color: Styles
                          .defaultLightWhiteColor)),
            if (viewModel.isBusy)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
