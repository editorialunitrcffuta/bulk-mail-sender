class BankDetailsForm{
  String? accountNumber;
  String? bankName;
  String? nGOMembership;
  String? nGOName;
  String? receivedBy;
  String? registrationDate;
  String id;
  BankDetailsForm(this.id,this.accountNumber,this.bankName,this.nGOMembership,this.nGOName,this.receivedBy,this.registrationDate);
  Map<String,dynamic> _toJson() => {
    'accountNumber': accountNumber,
    'id': id,
    'bankName': bankName,
    'nGOMembership': nGOMembership,
    'nGOName': nGOName,
    'receivedBy': receivedBy,
    'registrationDate': registrationDate,
  };
  Map<String,dynamic> toJson() => _toJson();
}
