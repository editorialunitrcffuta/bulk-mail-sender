import 'dart:developer';

import 'widow.dart';
import 'widow_data_model.dart';

class YOMGraph {
  List<Widow> widowData;
  List<WidowDataModel>? graphModel;
  List<String>? bereavement; //x-axis
  List<int>? bereavementLength; //Y-axis
  YOMGraph.fromJson(this.widowData);
  List<WidowDataModel> getSpouseBereavement() {
    getYOM();
    getYOMLength();
    List<WidowDataModel> widows = [];
    for (int i = 0; i < bereavementLength!.length; i++) {
      widows
          .add(WidowDataModel(x: bereavement![i], data: bereavementLength![i]));
    }
    return widows;
  }

  List<int> getYOMLength() {
    List<int> result = [];
    // if(widowData!=null){
    print('Year of marriage length: ${widowData.length}');
    List<String> returnedVal = [];
    for (int i = 0; i < widowData.length; i++) {
      if (i < 21) {
        returnedVal.add(widowData[i].yearOfMarriage != null
            ? widowData[i].yearOfMarriage.toString()
            : '');
      } else {
        // returnedVal[20] = '20+';
      }
    }
    log('${result.length}');
    bereavementLength = result;
    return result;
    // }else{
    //   return <int>[];
    // }
  }

  void getYOM() {
    // if(widowData!=null){
    print('Year of marriage lengthX: ${widowData.length}');
    bereavement = List.generate(20, (index) {
      if (index == 21) {
        return '20+';
      }
      return 'index';
    });
    // }else{
    //   return <String>[];
    // }
  }
}
