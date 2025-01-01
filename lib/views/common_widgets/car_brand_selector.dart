//!------------------ Creating Populer car with like ----------------//

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../utils/colors.dart';
import '../../utils/utilfunction.dart';
import 'custom_text.dart';

class CarBrandSelector extends StatefulWidget {
  CarBrandSelector({
    Key? key,
    required this.brand_name_,
    this.is_selected_,
  }) : super(key: key);

  final String brand_name_;
  bool? is_selected_;

  @override
  State<CarBrandSelector> createState() => _CarBrandSelectorState();
}

class _CarBrandSelectorState extends State<CarBrandSelector> {
  // bool IsSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.is_selected_ = !widget.is_selected_!;
          Logger().e(widget.is_selected_);
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 32,
          width: 88,
          decoration: BoxDecoration(
            color: widget.is_selected_!
                ? kblack.withOpacity(0.8)
                : klightgrayCollor,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: Utils.KdefaultBoxShadow(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: widget.brand_name_,
                color: widget.is_selected_! ? kwhite : kblack,
                fontweight: FontWeight.w600,
                fontsize: 14,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
