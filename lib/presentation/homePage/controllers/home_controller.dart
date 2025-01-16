


import 'package:get/get.dart';
import 'package:taskgithub/data/model/github_model.dart';
import 'package:taskgithub/domain/usecases/get_services.dart';

class HomeController extends GetxController {

  final GetServices getServicesUseCase;
  HomeController(this.getServicesUseCase);


  final Rx<List<GithubModel>?> services = Rx<List<GithubModel>?>(null);
  final RxBool isLoading = false.obs;
  final RxString error = RxString('');
  final Rx<List<GithubModel>?> imgList = Rx<List<GithubModel>?>(null);

  Future<void> fetchServices() async {
    try {
      isLoading.value = true;
      error.value = '';
      final result = await getServicesUseCase.call();
      services.value = result;
      imgList.value = services.value!.take(5).toList();
    } catch (e) {
      error.value = e.toString();
      print('Error fetching services: $e');
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onInit() {
    fetchServices();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
