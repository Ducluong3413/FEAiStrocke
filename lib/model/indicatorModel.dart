// class IndicatorModel {
//   final int percent;
//   final IndicatorDetail clinicalIndicator;
//   final IndicatorDetail molecularIndicator;
//   final IndicatorDetail subclinicalIndicator;

//   IndicatorModel({
//     required this.percent,
//     required this.clinicalIndicator,
//     required this.molecularIndicator,
//     required this.subclinicalIndicator,
//   });

//   factory IndicatorModel.fromJson(Map<String, dynamic> json) {
//     return IndicatorModel(
//       percent: json['percent'],
//       clinicalIndicator: IndicatorDetail.fromJson(json['clinicalIndicator']),
//       molecularIndicator: IndicatorDetail.fromJson(json['molecularIndicator']),
//       subclinicalIndicator: IndicatorDetail.fromJson(
//         json['subclinicalIndicator'],
//       ),
//     );
//   }
// }

// class IndicatorDetail {
//   final int percent;
//   final int totalCount;
//   final int trueCount;

//   IndicatorDetail({
//     required this.percent,
//     required this.totalCount,
//     required this.trueCount,
//   });

//   factory IndicatorDetail.fromJson(Map<String, dynamic> json) {
//     return IndicatorDetail(
//       percent: json['percent'],
//       totalCount: json['totalCount'],
//       trueCount: json['trueCount'],
//     );
//   }
// }
class IndicatorModel {
  final double percent;

  final ClinicalIndicator clinicalIndicator;
  final MolecularIndicator molecularIndicator;
  final SubclinicalIndicator subclinicalIndicator;

  IndicatorModel({
    required this.percent,
    required this.clinicalIndicator,
    required this.molecularIndicator,
    required this.subclinicalIndicator,
  });

  // Phương thức từ JSON
  factory IndicatorModel.fromJson(Map<String, dynamic> json) {
    return IndicatorModel(
      percent: json['percent']?.toDouble() ?? 0.0,
      clinicalIndicator: ClinicalIndicator.fromJson(json['clinicalIndicator']),
      molecularIndicator: MolecularIndicator.fromJson(
        json['molecularIndicator'],
      ),
      subclinicalIndicator: SubclinicalIndicator.fromJson(
        json['subclinicalIndicator'],
      ),
    );
  }
}

class ClinicalIndicator {
  final double percent;
  final int trueCount;

  ClinicalIndicator({required this.percent, required this.trueCount});

  // Phương thức từ JSON
  factory ClinicalIndicator.fromJson(Map<String, dynamic> json) {
    return ClinicalIndicator(
      percent: json['percent']?.toDouble() ?? 0.0,
      trueCount: json['trueCount'] ?? 0,
    );
  }
}

class MolecularIndicator {
  final double percent;
  final int trueCount;

  MolecularIndicator({required this.percent, required this.trueCount});

  // Phương thức từ JSON
  factory MolecularIndicator.fromJson(Map<String, dynamic> json) {
    return MolecularIndicator(
      percent: json['percent']?.toDouble() ?? 0.0,
      trueCount: json['trueCount'] ?? 0,
    );
  }
}

class SubclinicalIndicator {
  final double percent;
  final int trueCount;

  SubclinicalIndicator({required this.percent, required this.trueCount});

  // Phương thức từ JSON
  factory SubclinicalIndicator.fromJson(Map<String, dynamic> json) {
    return SubclinicalIndicator(
      percent: json['percent']?.toDouble() ?? 0.0,
      trueCount: json['trueCount'] ?? 0,
    );
  }
}
