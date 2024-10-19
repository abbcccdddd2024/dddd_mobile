class DetectedObject {
  String name;
  double confidence;
  String position;
  double distance; //0.0 m

  DetectedObject({
    required this.name,
    required this.confidence,
    required this.position,
    required this.distance,
  });
}
