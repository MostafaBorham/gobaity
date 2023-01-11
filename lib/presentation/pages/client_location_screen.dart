import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yallabaity/network_layer/models/data_models/location_model.dart';
import 'package:yallabaity/presentation/Dialogs/dialogs.dart';
import 'package:yallabaity/presentation/manager/bloc_user/cubit_user.dart';
import 'package:yallabaity/presentation/manager/cubit_dialog/dialog_manager_cubit.dart';
import 'package:yallabaity/presentation/manager/cubit_location_manager/location_manager_cubit.dart';
import 'package:yallabaity/presentation/manager/cubit_places_autocomplete/places_auto_complete_cubit.dart';
import 'package:yallabaity/presentation/resources/colors_manager.dart';
import 'package:yallabaity/presentation/resources/constants_manager.dart';
import 'package:yallabaity/presentation/resources/routes_manager.dart';
import 'package:yallabaity/presentation/resources/strings_manager.dart';
import 'package:yallabaity/presentation/resources/styles_manager.dart';
import 'package:yallabaity/presentation/resources/values_manager.dart';
import 'package:yallabaity/presentation/widgets/circular_icon_button.dart';
import 'package:yallabaity/presentation/widgets/custom_button.dart';
import 'package:yallabaity/presentation/widgets/custom_dialog.dart';
import 'package:yallabaity/presentation/widgets/search.dart';
import '../resources/assets_manager.dart';
import 'address_details.dart';

class ClientLocationScreen extends StatelessWidget {
  final LatLng egyptLatLang = const LatLng(30.033333, 31.233334);
  GoogleMapController? googleMapController;
  double? latitude;
  double? longitude;
  String message = '';
  BuildContext? locationBuilderContext;
  ClientLocationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocationManagerCubit()),
          BlocProvider(create: (context) => DialogManagerCubit()),
          BlocProvider(lazy: false, create: (context) => PlacesAutoCompleteCubit()..placeAutoComplete('mall')),
        ],
        child: BlocBuilder<DialogManagerCubit, DialogManagerState>(
          builder: (context, state) => Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: BlocConsumer<LocationManagerCubit, LocationManagerState>(
                  listener: (context, state) {
                    if (state is LocationLoaded) {
                      latitude = state.latitude;
                      longitude = state.longitude;
                      googleMapController!.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(latitude!, longitude!), zoom: 18)));
                    }
                  },
                  builder: (context, state) {
                    locationBuilderContext = context;
                    return GoogleMap(
                      onMapCreated: (controller) {
                        googleMapController = controller;
                        LocationManagerCubit.getLocationEvent(context);
                      },
                      initialCameraPosition: CameraPosition(
                        target: egyptLatLang,
                        zoom: 12,
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: AppHeight.s313 * Constants.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.3493, 0.886],
                    colors: [ColorsManager.black.withOpacity(0.5), ColorsManager.white.withOpacity(0.5)],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.margin,
                  ),
                  child: Column(//set widgets vertically
                    children: [
                      SizedBox(
                        height: AppHeight.s45 * Constants.height,
                      ),
                      Row(// set widgets horizontally
                        children: [
                          CircularIconButton(
                            asset: AssetsManager.back,
                            radius: AppWidth.s46 * Constants.width / 2,
                            height: AppWidth.s20 * Constants.width,
                            width: AppWidth.s12 * Constants.width,
                            color: ColorsManager.white,
                            ontap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(
                            width: AppWidth.s13 * Constants.width,
                          ),
                          Text(
                            AppStrings.addressDetails,
                            style: getSemiBoldStyle(
                              color: ColorsManager.white,
                              fontSize: AppWidth.s20 * Constants.width,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppHeight.s30 * Constants.height,
                      ),
                      Search(hintText: AppStrings.searchForAddress),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: AppHeight.s15 * Constants.height),
                        margin: EdgeInsets.symmetric(horizontal: AppWidth.s27 * Constants.width),
                        decoration: BoxDecoration(
                            color: ColorsManager.antiFlashWhite,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(AppWidth.s15 * Constants.width),
                                bottomRight: Radius.circular(AppWidth.s15 * Constants.width))),
                        child: Row(// set widgets horizontally
                          children: [
                            SizedBox(
                              width: AppWidth.s23 * Constants.width,
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorsManager.maximumPurple, width: 1),
                                  color: ColorsManager.white,
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: EdgeInsets.all(AppWidth.s3 * Constants.width),
                                child: CircleAvatar(
                                  radius: (AppWidth.s12 * Constants.width) / 2,
                                  backgroundColor: ColorsManager.maximumPurple,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppWidth.s15 * Constants.width,
                            ),
                            Text(
                              AppStrings.useMyCurrentLocation,
                              style: getMediumStyle(fontSize: AppWidth.s13 * Constants.width),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: AppHeight.s33*Constants.height,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Constants.margin),
                      child: CustomButton(
                        text: AppStrings.confirmForDelivery,
                        onPressed: () {
                          UserCubit.updateUserLocationEvent(context, LocationModel(latitude: latitude, longitude: longitude));
                          DialogManagerCubit.changeDialogStateEvent(context);
                        },
                      ),
                    ),
                  )),
              if (state.show!)
                BlocConsumer<UserCubit, UserState>(
                  listener: (context, state) async {
                    if (state is UpdatedUserLocation) {
                      Placemark place = await LocationManagerCubit.gerPlaceNameEvent(locationBuilderContext);

                      Future.delayed(const Duration(seconds: 2)).then((value) {
                        DialogManagerCubit.changeDialogStateEvent(context);
                        Navigator.pushNamed(context, Routes.addressDetailRoute,
                            arguments: {AddressDetailsScreen.placeKey: place});
                      });
                    } else if (state is LoadingLocationFailed) {
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        DialogManagerCubit.changeDialogStateEvent(context);
                      });
                    }
                  },
                  builder: (context, state) {
                   debugPrint(state.runtimeType.toString());
                    switch (state.runtimeType) {
                      case UpdatingUserLocation:
                        message = (state as UpdatingUserLocation).message;
                        break;
                      case UpdatedUserLocation:
                        message = (state as UpdatedUserLocation).userResponseEntity.message!;

                        break;
                      case UpdatingUserLocationFailed:
                        message = (state as UpdatingUserLocationFailed).message;
                        break;
                      default:
                        message = '';
                    }
                   debugPrint(message);
                    return Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: ColorsManager.black.withOpacity(0.2),
                        child: CustomDialog(
                          showCircularLoading: state is! UpdatedUserLocation,
                          message: message,
                        ),
                      ),
                    ));
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
