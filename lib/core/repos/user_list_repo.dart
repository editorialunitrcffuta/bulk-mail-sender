import '../../app/app_setup.locator.dart';
import '../models/form/personal_data.dart';
import '../services/firestore_service.dart';

class ChildrenListRepo{
  final _fsService = locator<FirestoreService>();
  
  Future<List<PersonalDataForm>> getListOfUsers()async{
    List<PersonalDataForm> childrenList =  await _fsService.getChildrenCollection();
    print("Children List in children Repo: ${childrenList[0]}");
    return childrenList;
  }
}