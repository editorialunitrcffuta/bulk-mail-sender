// import 'dart:io';
//
// import 'package:image_picker/image_picker.dart';
// import 'package:stacked_services/stacked_services.dart';
//
// import '../../app/app_setup.locator.dart';
// import '../../app/app_setup.logger.dart';
//
// export 'package:image_picker/image_picker.dart' show ImageSource;
//
// final _log = getLogger("ImagePickerService");
//
// Future<PickedFile?> pickProfileImage(
//     {ImageSource source = ImageSource.gallery}) async {
//   PickedFile? selectedFile = await ImagePicker.platform.pickImage(
//       source: source, maxHeight: 460, maxWidth: 460, imageQuality: 70);
//   if (selectedFile != null) {
//     return selectedFile;
//   } else {
//     locator<SnackbarService>().showSnackbar(
//         message: "Sorry, an error occurred! Could not pick image from phone");
//     return null;
//   }
// }
