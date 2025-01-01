// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class CarModel {
  CarModel({
    required this.brand_name,
    this.isSelect,
  });

  final String brand_name;
  bool? isSelect;
}

List<CarModel> car_brand_detail = [
  CarModel(
    brand_name: 'SUV',
    isSelect: true,
  ),
  CarModel(
    brand_name: 'Ferrari',
    isSelect: false,
  ),
  CarModel(
    brand_name: 'BMW',
    isSelect: true,
  ),
  CarModel(
    brand_name: 'Bugatti',
    isSelect: false,
  ),
  CarModel(
    brand_name: 'Mustang',
    isSelect: false,
  ),
  CarModel(
    brand_name: 'Mercedes',
    isSelect: false,
  ),
  CarModel(
    brand_name: 'Audi',
    isSelect: false,
  ),
];

///////category details
///
