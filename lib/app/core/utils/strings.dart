const String appFont = "sofia";
const String anonymous_person = "assets/images/unknown_person.png";
const String emptyItems = "assets/images/emptyData.jpg";

const String mapKey = "key";
const String mapValue = "value";
Map<String, dynamic> successRequest({dynamic responseBody}) {
  return {
    mapKey: "success",
    mapValue: responseBody,
  };
}

Map<String, dynamic> failedRequest({dynamic responseBody}) {
  return {
    mapKey: "failed",
    mapValue: responseBody,
  };
}