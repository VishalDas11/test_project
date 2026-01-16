
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  services(); // External services
  await sharedService(); // SharedPreferences + StorageService
  dataSource(); // Data sources

  repositories(); // Repositories
  useCase(); // Use cases
  blocs(); // Bloc
}

Future sharedService() async {

}

void blocs() {


  // Bloc
}

void useCase() {


  // Use cases
}

void dataSource() {


}

void repositories() {

  // Repository
}

void services() {

}

resetAllLocator() async {
  await locator.reset();
  await setupLocator();
}
