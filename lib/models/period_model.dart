class Period {
  final String formattedtime;
  final String time;
  final double value;
  final double totalValue;
  final bool hasCourtesy;
  final double discount;

  Period({
    required this.formattedtime,
    required this.time,
    required this.value,
    required this.totalValue,
    required this.hasCourtesy,
    required this.discount,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      formattedtime: json['tempoFormatado'],
      time: json['tempo'],
      value: (json['valor'] as num).toDouble(),
      totalValue: (json['valorTotal'] as num).toDouble(),
      hasCourtesy: json['temCortesia'],
      discount: json['desconto'] is Map<String, dynamic>
          ? (json['desconto']['desconto'] as num?)?.toDouble() ?? 0.0
          : (json['desconto'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
