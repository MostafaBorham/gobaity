import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkStatus{
  Future<bool> get isConnected;
}
class NetworkStatusImpl extends NetworkStatus{
  final InternetConnectionChecker checker;
  NetworkStatusImpl({required this.checker});
  @override
  Future<bool> get isConnected => checker.hasConnection;

}