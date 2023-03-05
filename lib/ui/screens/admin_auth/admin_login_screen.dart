import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../layout/widgets/custom_textfieldX.dart';
import '../../responsive.dart';
import '../../widgets/buttons/base_button.dart';
import '../main_screen/main_screen.dart';
import 'view_model/admin_login_view_model.dart';

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: ViewModelBuilder<AdminLoginViewModel>.reactive(
          viewModelBuilder: () => AdminLoginViewModel(),
          disposeViewModel: true,
          builder: (context, model, _) => Padding(
            padding: Responsive.isMobile(context)
                ? const EdgeInsets.all(0)
                : EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 1.2,
                  ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      child: Column(
                        children: [
                          //Logo can be here
                          Image.asset('assets/ondo_logo.png', height: 50),
                          // Image.asset(
                          //   'assets/stacked_image.png',
                          //   height: Responsive.isMobile(context) ? 33 : 48.49,
                          //   width:
                          //       Responsive.isMobile(context) ? 154 : 224.38,
                          // ),
                          const SizedBox(height: 20),
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Responsive.isMobile(context) ? 24 : 34,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: CustomTextFieldX(
                              labelText: 'Email',
                              hint: "email@gmail.com",
                              isEditable: true,
                              controller: model.emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: CustomTextFieldX(
                              labelText: 'Password',
                              isEditable: true,
                              hint: "***********",
                              obscureText: model.isHidden,
                              controller: model.passwordController,
                              suffixIcon: GestureDetector(
                                onTap: model.showPassword,
                                child: Icon(
                                  model.isHidden == true
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye_rounded,
                                ),
                              ),
                            ),
                          ),
                          BaseButton(
                            isBusy: model.isBusy,
                            textButton: 'Login',
                            onPress: () => model.login(),
                          ),
                        ],
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
