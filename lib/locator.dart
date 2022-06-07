import 'package:get_it/get_it.dart';
import 'package:it_intership_jobs_r2s/utils/routing/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
