// To parse this JSON data, do
//
//     final ninjaApi = ninjaApiFromJson(jsonString);

class NinjaModel {
  NinjaModel({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.instructions,
  });

  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? difficulty;
  String? instructions;

  @override
  String toString() {
    return toString();
  }

  factory NinjaModel.fromJson(Map<String, dynamic> json) => NinjaModel(
        name: json["name"],
        type: json["type"],
        muscle: json["muscle"],
        equipment: json["equipment"],
        difficulty: json["difficulty"],
        instructions: json["instructions"],
      );
}
