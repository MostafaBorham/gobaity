import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_tile_%20button.dart';
import 'package:yallabaity/presentation/widgets/my_current_location_details_widget.dart';
import 'package:yallabaity/presentation/widgets/payment_details_widget.dart';
import 'package:yallabaity/presentation/widgets/payment_widget.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';
import 'package:yallabaity/presentation/widgets/custom_checkbox.dart';
import 'package:yallabaity/presentation/widgets/custom_button.dart';


class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    return LinearGradientBody(
      appbarTitle: 'Checkout',
      showCart: false,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidth.s30*Constants.width),
            child: Column(//set widgets vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppHeight.s20*Constants.height,
                ),
                MyCurrentLocationDetails(),
                SizedBox(
                  height: AppHeight.s16*Constants.height,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: getMediumStyle(
                            fontSize: AppWidth.s14*Constants.width,
                            color: ColorsManager.maximumPurple),
                      ),
                    )),
                SizedBox(
                  height: AppHeight.s15*Constants.height,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payment',
                    style: getMediumStyle(
                        fontSize: AppWidth.s17*Constants.width, color: ColorsManager.black),
                  ),
                ),
                SizedBox(
                  height: AppHeight.s22*Constants.height,
                ),
                PaymentWidget(
                  selectedItem: (index) {},
                ),
                SizedBox(
                  height: AppHeight.s30*Constants.height,
                ),
                PaymentDetailsWidget(),
                SizedBox(
                  height: AppHeight.s30*Constants.height,
                ),
                Row(// set widgets horizontally
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Place Order NOW',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.doneRoute);
                        },
                      ),
                    ),
                    SizedBox(
                      width: AppWidth.s18*Constants.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 2, color: ColorsManager.maximumPurple)),
                      child: IconButton(
                        onPressed: () {
                          showCalenderDialog();
                        },
                        icon: SvgPicture.asset(AssetsManager.calender),
                        padding: EdgeInsets.symmetric(
                            vertical: AppHeight.s12*Constants.height,
                            horizontal: AppWidth.s20*Constants.width),
                        constraints: BoxConstraints(minHeight: 0, minWidth: 0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCalenderDialog() => showDialog(
        context: context,
        builder: (context) {
          return Column(//set widgets vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppHeight.s54*Constants.height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                child: CircularIconButton(
                  asset: AssetsManager.close,
                  assetColor: ColorsManager.black,
                ),
              ),
              SizedBox(
                height: AppHeight.s22*Constants.height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.s9*Constants.width),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,// is used to clip the internal child widget of container when u define border radius,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Material(
                    child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.utc(2023),
                      onDateChanged: (DateTime dateTime) {
                       debugPrint(dateTime.toString());
                        _dateTime = dateTime;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppHeight.s17*Constants.height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.s31*Constants.width),
                child: CustomTileButton(
                  text: 'Select time',
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: AppHeight.s100*Constants.height,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                child: SizedBox(
                  width: double.maxFinite,
                  child: CustomButton(
                    text: 'Apply',
                    onPressed: () {
                      _dateTime = _dateTime ?? DateTime.now();

                      Navigator.of(context).pop();
                    },
                  ),
                ),
              )
            ],
          );
        },
      );
}
