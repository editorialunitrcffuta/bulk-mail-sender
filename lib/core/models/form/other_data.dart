class OtherDataForm{
  String? husbandName;
  String? husbandOccupation;
  String? yearOfMarriage;
  String? numberOfChildren;
  String? dOD;
  String? cBN;
  String? senatorialDistrict;
  String id;
  OtherDataForm(this.id,this.husbandName,this.husbandOccupation,this.yearOfMarriage,this.numberOfChildren,this.dOD,
    this.cBN,this.senatorialDistrict,);

  Map<String,dynamic> _toJson() => {
    'id': id,
    'husbandName': husbandName,
    'husbandOccupation': husbandOccupation,
    'yearOfMarriage': yearOfMarriage,
    'numberOfChildren': numberOfChildren,
    'dOD': dOD,
    'cBN': cBN,
    'senatorialDistrict': senatorialDistrict,
  };
  Map<String,dynamic> toJson() => _toJson();
}