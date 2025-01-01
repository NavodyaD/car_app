// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class PopulerModel {
  PopulerModel({
    required this.image,
    required this.model,
    required this.yom,
    required this.discreption,
    this.isLike,
  });

  final String model;
  final String yom;
  final String discreption;
  final String image;
  bool? isLike = false;
}

List<PopulerModel> Populer_Car_details = [
  PopulerModel(
    model: 'Bugatti Divo',
    yom: '2019',
    image: 'bugatti.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: true,
  ),
  PopulerModel(
    model: 'BMW z4',
    yom: '2022',
    image: 'bmwm4.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: false,
  ),
  PopulerModel(
    model: 'Mustang',
    yom: '2019',
    image: 'mustang2.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: false,
  ),
  PopulerModel(
    model: 'Ferrari',
    yom: '2023',
    image: 'ferrari.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: true,
  ),
  PopulerModel(
    model: 'Bugatti Divo',
    yom: '2019',
    image: 'bugatti.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: true,
  ),
  PopulerModel(
    model: 'BMW z4',
    yom: '2022',
    image: 'bmwm4.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: false,
  ),
  PopulerModel(
    model: 'Mustang',
    yom: '2019',
    image: 'mustang2.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: false,
  ),
  PopulerModel(
    model: 'Ferrari',
    yom: '2023',
    image: 'ferrari.png',
    discreption: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ',
    isLike: true,
  ),
];

///////category details
///
