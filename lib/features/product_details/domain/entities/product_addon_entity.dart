class ProductAddonEntity {
  final String id;
  final String title;
  final String titleAr;
  final List<AddonOptionEntity> options;

  ProductAddonEntity({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.options,
  });

  factory ProductAddonEntity.fromJson(Map<String, dynamic> json) {
    return ProductAddonEntity(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      titleAr: json['title_ar'] ?? '',
      options: (json['options'] as List? ?? [])
          .map((option) => AddonOptionEntity.fromJson(option))
          .toList(),
    );
  }
}

class AddonOptionEntity {
  final String label;
  final String labelAr;
  final bool selectedByDefault;

  AddonOptionEntity({
    required this.label,
    required this.labelAr,
    required this.selectedByDefault,
  });

  factory AddonOptionEntity.fromJson(Map<String, dynamic> json) {
    return AddonOptionEntity(
      label: json['label'] ?? '',
      labelAr: json['label_ar'] ?? '',
      selectedByDefault: json['selected_by_default'] ?? false,
    );
  }
}
