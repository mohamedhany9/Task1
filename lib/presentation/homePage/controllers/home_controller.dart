
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taskgithub/data/model/github_model.dart';
import 'package:taskgithub/domain/usecases/get_services.dart';

class HomeController extends GetxController {

  final GetServices getServicesUseCase;
  HomeController(this.getServicesUseCase);


  late List<ConnectivityResult> connectivityResult ;


  final Rx<List<GithubModel>?> services = Rx<List<GithubModel>?>(null);
  final RxBool isLoading = false.obs;
  final RxString error = RxString('');
  final Rx<List<GithubModel>?> imgList = Rx<List<GithubModel>?>(null);

  late GithubModel itemDetails;

  final storage = GetStorage();

  Future<void> fetchServices() async {

   try {

    final dynamic storedData = storage.read('github');
    if (storedData != null) {
      if (storedData is List) {
        services.value = storedData
            .map((item) => GithubModel.fromJson(Map<String, dynamic>.from(item)))
            .toList();
      }
      imgList.value = services.value!.take(5).toList();
    }
    else{
      isLoading.value = true;
      error.value = '';
      final result = await getServicesUseCase.call();
      services.value = result;
      imgList.value = services.value!.take(5).toList();
      storage.write('github',result);
    }

    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }


  @override
  void onInit() async{
    connectivityResult = await (Connectivity().checkConnectivity());
    fetchServices();
    super.onInit();
  }


}
