import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/pages/checkout_screen.dart';
import 'package:yallabaity/presentation/widgets/my_current_location_details_widget.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';
import 'package:yallabaity/presentation/widgets/custom_checkbox.dart';
import 'package:yallabaity/presentation/widgets/custom_textfield.dart';
import 'package:yallabaity/presentation/widgets/custom_button.dart';

class AddressDetailsScreen extends StatelessWidget {
  static const String placeKey = 'place from map ';
  AddressDetailsScreen({Key? key}) : super(key: key);
  Placemark? place;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      place = arguments[placeKey] as Placemark;
     debugPrint(place!.street);
    }
    return LinearGradientBody(
      appbarTitle: 'Address Details',
      showCart: false,
      onBackPressed: () {
        Navigator.pop(context);
      },
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.s30 * Constants.width),
          child: Column(//set widgets vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppHeight.s30 * Constants.height,
              ),
              MyCurrentLocationDetails(
                governorate: place!.administrativeArea,
                city: place!.subAdministrativeArea!,
                street: place!.street,
              ),
              SizedBox(
                height: AppHeight.s16 * Constants.height,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Change',
                      style: getMediumStyle(fontSize: AppWidth.s14 * Constants.width, color: ColorsManager.maximumPurple),
                    ),
                  )),
              SizedBox(
                height: AppHeight.s16 * Constants.height,
              ),
              Form(
                  child: Column(//set widgets vertically
                children: [
                  CustomTextField(
                    hintText: 'Alarbeen St. ',
                  ),
                  SizedBox(
                    height: AppHeight.s19*Constants.height,
                  ),
                  CustomTextField(
                    hintText: 'Building Name/Number',
                  ),
                  SizedBox(
                    height: AppHeight.s19*Constants.height,
                  ),
                  CustomTextField(
                    hintText: 'Floor',
                  ),
                  SizedBox(
                    height: AppHeight.s19*Constants.height,
                  ),
                  CustomTextField(
                    hintText: 'Appartment no',
                  ),
                  SizedBox(
                    height: AppHeight.s30 * Constants.height,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: CustomButton(
                      text: 'Save Address',
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(Routes.checkoutRoute);
                      },
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
