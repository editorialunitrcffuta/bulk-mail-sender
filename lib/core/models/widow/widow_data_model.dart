class WidowDataModel {
  dynamic x;
  int? data;
  WidowDataModel({this.x, this.data});
  @override
  String toString() {
    return """
    x: $x,
    y: $data
    """;
  }
}
