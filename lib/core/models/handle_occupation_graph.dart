import 'dart:developer';

import 'widow/widow.dart';
import 'widow/widow_data_model.dart';

class HandleOccupationGraph {
  List<MembersModel> widowData;
  List<WidowDataModel>? graphModel;
  List<String>? occupation;
  List<int>? occupationLength;

  HandleOccupationGraph.fromJson(this.widowData);

  List<WidowDataModel> getOccupations() {
    getOccupation();
    getOccupationLength();
    List<WidowDataModel> widows = [];
    for (int i = 0; i < occupationLength!.length; i++) {
      widows.add(WidowDataModel(x: occupation![i], data: occupationLength![i]));
    }
    return widows;
  }

  List<int> getOccupationLength() {
    List<int> result = [];
    // if(widowData!=null){
    print('Occupation length: ${widowData.length}');
    for (var listOccupation in occupation!) {
      // for(var setOccupation in occupation().toSet){
      int initialValue = 0;
      for (var setOccupation in occupation!.toSet()) {
        if (setOccupation == listOccupation) {
          initialValue++;
        }
      }
      // }
      result.add(initialValue);
    }
    log('${result.length}');
    occupationLength = result;
    return result;
    // }else{
    //   return <int>[];
    // }
  }

  void getOccupation() {
    // if(widowData!=null){
    print('Occupation lengthX: ${widowData.length}');
    occupation = widowData.map((value) => value.occupation ?? '').toList();
    // }else{
    //   return <String>[];
    // }
  }
}
