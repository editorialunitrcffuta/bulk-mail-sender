import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app_setup.locator.dart';
import '../../../../app/app_setup.logger.dart';
import '../../../../app/app_setup.router.dart';
import '../../../../core/models/form/personal_data.dart';
import '../../../../core/repos/user_list_repo.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../utils/split_helper.dart';
import '../../form/sub_views/form_screen1.dart';
import 'dart:developer';

class MainScreenViewModel extends BaseViewModel {
  final _log = getLogger((MainScreenViewModel).toString());
  final _fsService = locator<FirestoreService>();
  final ChildrenListRepo _childrenListRepo = ChildrenListRepo();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  TextEditingController searchController = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController homeTown = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController skill = TextEditingController();
  late final DateTime registrationDate;
  final List<String> districts = ["Ondo North", "Ondo Central", "Ondo South"];

  /// get a particular user at index
  PersonalDataForm? _currentUser;

  /// list to store children details
  List<PersonalDataForm> children = [];

  int _pageIndex = 0;
  int _formIndex = 0;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  // int? _sortColumnIndex;
  // bool _sortAscending = true;
  String uid = '';

  /// variable to load PersonalDataForm model
  bool _onTap = false;

  ///get number of pages
  int numPages() => children.length;

  /// getters
  bool get onTap => _onTap;

  PersonalDataForm? get currentUser => _currentUser;

  String? imageUrl;
  String? employmentStatus;
  String? gender;
  String? typeOfOccupation;
  bool? isSkillful;
  String? skillDescription;
  String? levelOfEducation, maritalStatus, senatorialDistrict;

  String country = '';
  String _stateOfOrigin = 'Ondo', _stateOfRes = 'Ondo';
  String lGAofOrigin = '', lGAofResidence = '';
  String city = '';

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  DateTime? _dateOfBirth;

  String get stateOfOrigin => _stateOfOrigin;

  String get stateOfRes => _stateOfRes;

  set stateOfOrigin(String value) {
    _stateOfOrigin = value;
    notifyListeners();
  }

  set stateOfRes(String value) {
    _stateOfRes = value;
    notifyListeners();
  }

  DateTime? get dateOfBirth => _dateOfBirth;

  set dateOfBirth(DateTime? value) {
    _dateOfBirth = value;
    notifyListeners();
    dob.text = value != null
        ? "${value.day.formString}-${value.day.formString}-${value.year}"
        : "";
  }

  int get formIndex => _formIndex;

  int get pageIndex => _pageIndex;

  int get rowsPerPage => _rowsPerPage;

  final List formPages = [
    const FormScreen1(),
  ];

  MainScreenViewModel() {
    uid = DateTime.now().millisecondsSinceEpoch.toString();
    registrationDate = DateTime.now();
    // _fsService
    //     .getChildrenCollection()
    //     .then((value) => print("Completed query!"));
  }

  void changePage(int index) {
    print(index);
    _rowsPerPage = index;
    notifyListeners();
  }

  // Future<void> editImage() async {
  //   imageFile = await pickProfileImage();
  //   _log.i("Selected file: $imageFile");
  //   notifyListeners();
  // }

  void nextFormPage() async {
    if (form.currentState!.validate()) {
      if (_formIndex != formPages.length - 1) {
        // await uploadPersonalInformation(_formIndex);
        _formIndex++;
        log('\n\n\n\n\nForm Index: $_formIndex\n\n\n\n\n');
        notifyListeners();
      } else {}
    } else {
      locator<SnackbarService>().showSnackbar(
          message:
              "You have not filled some fields! Please, check through the whole form");
      return;
    }
  }

  void previousFormPage() async {
    if (_formIndex != 0) {
      _formIndex--;
      log('\n\n\n\n\nForm Index: $_formIndex\n\n\n\n\n');
      notifyListeners();
    } else {}
  }

  Future<void> submit() async {
    if (form.currentState!.validate()) {
      await updatePersonalData();
    } else {
      locator<SnackbarService>().showSnackbar(
          message:
              "You have not filled some fields! Please, check through the whole form");
      return;
    }
  }

  Future<void> updatePersonalData() async {
  //   if (imageFile != null) {
  //     try {
  //       imageUrl = await runBusyFuture(
  //           uploadFile(
  //               file: imageFile!,
  //               name: fullName.text.replaceAll(' ', '') + uid),
  //           throwException: true);
  //       notifyListeners();
  //     } catch (e) {
  //       _log.i("Upload file error: $e");
  //     }
  //   } else {
  //     locator<SnackbarService>()
  //         .showSnackbar(message: "Please, set profile image!");
  //     return;
  //   }
  //   PersonalDataForm _personalData = PersonalDataForm(
  //     id: fullName.text.replaceAll(' ', '') + uid,
  //     fullName: fullName.text,
  //     gender: gender,
  //     dateOfBirth: dateOfBirth,
  //     stateOfOrigin: _stateOfOrigin,
  //     localGovernmentOfOrigin: lGAofOrigin,
  //     homeTown: homeTown.text,
  //     phoneNumber: phone.text,
  //     email: email.text,
  //     address: address.text,
  //     state: _stateOfRes,
  //     localGovernment: lGAofResidence,
  //     levelOfEducation: levelOfEducation,
  //     typeOfOccupation: typeOfOccupation,
  //     isSkillful: isSkillful,
  //     skillDescription: skillDescription,
  //     employmentStatus: employmentStatus,
  //     skill: skill.text,
  //     registrationDate: registrationDate,
  //     imageUrl: imageUrl,
  //     maritalStatus: maritalStatus,
  //     senatorialDistrict: senatorialDistrict,
  //   );
  //
  //   try {
  //     await runBusyFuture(_fsService.uploadWidowsInformation(
  //         _personalData.toJson(), phone.text));
  //
  //     locator<SnackbarService>().showSnackbar(
  //         message: "Your information has been submitted successfully");
  //     locator<NavigationService>().navigateTo(Routes.welcomeScreen);
  //
  //     log('Personal data Success');
  //     log('Data Submitted: ${_personalData.toJson()}\n\n');
  //   } catch (e) {
  //     log(e.toString());
  //   }
  }

  /// function to pass data to edit screen
  void onClicked(PersonalDataForm model) {
    _currentUser = model;
    _onTap = true;
    notifyListeners();
  }

  /// function to remove data from edit screen once done
  void onClose() {
    _onTap = false;
    locator<NavigationService>().replaceWith(Routes.mainScreen);
    notifyListeners();
  }

  getChildrenList() async {
    children = await _childrenListRepo.getListOfUsers();
    print("Child at index 0: ${children[0]}");
    notifyListeners();
    searchController.addListener(() {
      print(searchController.text);
      searchForCard(searchController.text);
    });
    notifyListeners();
  }

  // helps in filtering the already gotten list

  List<PersonalDataForm> filteredChildrenList = [];

  searchForCard(String searchValue) {
    filteredChildrenList.clear();
    if (searchValue.isEmpty) {
      notifyListeners();
      return;
    }

    for (var element in children) {
      String _fullName = SplitHelper.getFullName(value: element.id);
      if (_fullName.toLowerCase().contains(searchValue)) {
        filteredChildrenList.add(element);
      }
      notifyListeners();
    }
  }

  Future<void> onSearch(String search) async {
    String _fullName(element) => SplitHelper.getFullName(value: element.id);
    List<PersonalDataForm> newList = children
        .where((element) =>
            _fullName(element).contains(RegExp(search, caseSensitive: false)))
        .toList();
    for (var element in newList) {
      print(newList);
      print('These are items in new list ${element.id}');
    }
    //emit here
    children = newList;
    notifyListeners();
  }
}

extension on int {
  String get formString {
    return this > 10 ? '${this}' : '0${this}';
  }
}
