class TrainingMinData {
  final double weight;
  final int rep;

  TrainingMinData({required this.weight, required this.rep});
}

class TrainingDateData {
  final DateTime trainingDate;
  final double totalWeight;
  final List<TrainingMinData> trainingList;

  TrainingDateData({required this.trainingDate, required this.totalWeight, required this.trainingList});
}
