import 'package:get_it/get_it.dart';
import 'package:rareview_app/src/shared/image/controller/image_controller.dart';
import 'package:rareview_app/src/shared/image/service/image_service.dart';
import 'package:rareview_app/src/shared/image/service/image_service_impl.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  //controllers
  serviceLocator
      .registerLazySingleton(() => ImageController(imageService: serviceLocator()));

  //service
  serviceLocator.registerLazySingleton<ImageService>(() => ImageServiceImpl());
}
