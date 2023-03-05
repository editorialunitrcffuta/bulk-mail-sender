import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_setup.locator.dart';
import '../../responsive.dart';
import '../../widgets/buttons/form_ button.dart';
import '../main_screen/view_model/main_screen_view_model.dart';
import 'widgets/form_header_widget.dart';
import 'widgets/form_image_widget.dart';
import 'widgets/form_submit_button.dart';
import 'widgets/privacy_popup.dart';
import 'widgets/terms_of_use_widget.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ViewModelBuilder<MainScreenViewModel>.reactive(
          viewModelBuilder: () => locator<MainScreenViewModel>(),
          disposeViewModel: false,
          builder: (context, viewModel, _) => Padding(
            padding: Responsive.isMobile(context)
                ? const EdgeInsets.all(0)
                : EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 1.2),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FormHeaderWidget(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 62, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  FormTitleWidget(),
                                  // DpImageWidget(
                                  //   placeholderAsset: 'assets/em.png',
                                  //   height: 150,
                                  //   width: 125,
                                  //   isCircular: false,
                                  //   // imageFile: viewModel.imageFile,
                                  //   imageUrl: viewModel.imageFile?.path,
                                  //   editCallback: viewModel.editImage,
                                  // )
                                ],
                              ),
                              const TermsOfUseWidget(),
                              Responsive.isDesktop(context)
                                  ? const PrivacyPopup()
                                  : const SizedBox(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: Form(
                                  key: viewModel.form,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: viewModel
                                        .formPages[viewModel.formIndex],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (viewModel.formIndex != 0)
                                    FormButton(
                                      prefixIcon: Icons.arrow_back,
                                      textButton: 'Previous',
                                      onpressed: () =>
                                          viewModel.previousFormPage(),
                                    ),
                                  if (viewModel.formIndex != 2)
                                    FormButton(
                                      isBusy: viewModel.isBusy,
                                      suffixIcon: Icons.arrow_forward,
                                      textButton: 'Next',
                                      onpressed: () => viewModel.nextFormPage(),
                                    ),
                                  if (viewModel.formIndex == 2)
                                    const FormSubmitButton(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}