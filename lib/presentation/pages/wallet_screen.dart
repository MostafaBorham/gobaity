import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:yallabaity/network_layer/models/wallet_model.dart';
import 'package:yallabaity/presentation/resources/assets_manager.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/custom_tile_%20button.dart';
import 'package:yallabaity/presentation/widgets/icon_button.dart';
import 'package:yallabaity/presentation/widgets/linear_gradient_body.dart';
import 'package:yallabaity/presentation/widgets/gradient_background.dart';
import 'package:yallabaity/presentation/widgets/custom_appbar.dart';
import 'package:yallabaity/presentation/widgets/custom_button.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({Key? key}) : super(key: key);
  List<WalletModel> list = [
    WalletModel('today', [
      Balance(net: '145.00', tax: '15.00'),
      Balance(net: '150.00', tax: '15.00'),      Balance(net: '145.00', tax: '15.00'),
      Balance(net: '150.00', tax: '15.00'),
    ]),
    WalletModel('Yesterday', [
      Balance(net: '145.00', tax: '15.00'),
      Balance(net: '150.00', tax: '15.00'),
    ]),
    WalletModel('saturday', [
      Balance(net: '145.00', tax: '15.00'),
      Balance(net: '150.00', tax: '15.00'),
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    return LinearGradientBody(
      appbarTitle: 'My wallet',
      showCart: false,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(//set widgets vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppHeight.s15*Constants.height,
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: AppHeight.s30*Constants.height),
                    decoration: BoxDecoration(
                        color: ColorsManager.maximumPurple.withOpacity(0.65),
                        borderRadius: BorderRadius.circular(17)),
                    child: Row(// set widgets horizontally
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: AppWidth.s224*Constants.width,
                          child: Text(
                            'To withdraw your money Please enter your bank account',
                            style: getMediumStyle(
                                color: ColorsManager.white,
                                fontSize: AppWidth.s13*Constants.width),
                          ),
                        ),
                        CustomIconButton(
                          asset: AssetsManager.arrow,
                          color: ColorsManager.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppHeight.s30*Constants.height,
              ),
              Text(
                'Your Balance',
                style: getMediumStyle(
                    fontSize: AppWidth.s12*Constants.width,
                    color: ColorsManager.maximumPurple),
              ),
              Text(
                '145.00',
                style: getBoldStyle(
                  fontSize: AppWidth.s40*Constants.width,
                  color: ColorsManager.maximumPurple,
                ),
              ),
              Text(
                'EGP',
                style: getMediumStyle(
                    fontSize: AppWidth.s26*Constants.width,
                    color: ColorsManager.eerieBlack,
                  ),
              ),
              SizedBox(
                height: AppHeight.s30*Constants.height,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Constants.margin),
                  child: Text(
                    'Wallet History',
                    style: getMediumStyle(
                      fontSize: AppWidth.s17*Constants.width,
                      color: ColorsManager.eerieBlack,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppHeight.s16*Constants.height,
              ),
              Container(
                color: ColorsManager.lightSilver.withOpacity(0.29),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      _buildAccountBalanceItem(list[index], index),
                  separatorBuilder: (context, index) => Divider(
                    color: ColorsManager.platinum,
                    height: AppHeight.s44*Constants.height,
                    thickness: 7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAccountBalanceItem(WalletModel wallet,int index) => Column(//set widgets vertically
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(index==0)SizedBox(height: AppHeight.s33*Constants.height),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.margin),
        child: Text(
          wallet.date!,
          style: getMediumStyle(
            fontSize: AppWidth.s17*Constants.width,
            color: ColorsManager.davysGrey,
          ),
        ),
      ),
      ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: wallet.account!.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.margin),
          child: Column(//set widgets vertically
            children: [
              Row(// set widgets horizontally
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: wallet.account![index].net,
                        style: getBoldStyle(
                          fontSize: AppWidth.s25*Constants.width,
                          color: ColorsManager.fernGreen.withOpacity(0.8),
                        )),
                    TextSpan(
                        text: '  EGP',
                        style: getMediumStyle(
                          fontSize: AppWidth.s18*Constants.width,
                          color: ColorsManager.eerieBlack,
                        )),
                  ])),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppWidth.s10*Constants.width),
                    child: Column(//set widgets vertically
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Go bety tax',
                          style: getMediumStyle(
                            fontSize: AppWidth.s12*Constants.width,
                            color: ColorsManager.maximumPurple,
                          ),
                        ),
                        SizedBox(
                          height: AppHeight.s7*Constants.height,
                        ),
                        Text(
                          wallet.account![index].tax!,
                          style: getBoldStyle(
                            fontSize: AppWidth.s18*Constants.width,
                            color: ColorsManager.maximumPurple,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: ColorsManager.black.withOpacity(0.1),
          height: AppHeight.s34*Constants.height,
        ),
      ),
    ],
  );
}
