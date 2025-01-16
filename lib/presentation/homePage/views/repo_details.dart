import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskgithub/core/styles/styles_manager.dart';
import 'package:taskgithub/core/values/app_colors.dart';
import 'package:taskgithub/core/values/app_colors.dart';
import 'package:taskgithub/presentation/homePage/controllers/home_controller.dart';

class RepoDetailsScreen extends GetView<HomeController> {
  RepoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.obs;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Repo: repo1!'),
        actions: const [
          CloseButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRepoHeader(),
            _buildDescription(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Commits:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildCommitsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRepoHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ThemeColors.appColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          const Icon(
            Icons.pets,  // GitHub cat icon placeholder
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(width: 12),
          const Text(
            'repo1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          _buildStatItem(Icons.star, '3'),
          _buildStatItem(Icons.call_split, '1'),
          _buildStatItem(Icons.warning, '2'),
          _buildStatItem(Icons.remove_red_eye, '4'),
        ],
      ),
    );
  }


  Widget _buildStatItem(IconData icon, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 4),
          Text(
            count,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Description: This is repo1',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCommitsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        bool isVerified = index < 2;
        bool isSuccess = index < 3;
        return _buildCommitItem(isVerified: isVerified, isSuccess: isSuccess);
      },
    );
  }


  Widget _buildCommitItem({required bool isVerified, required bool isSuccess}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Initial commit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 12),
                const Text(
                  'John Doe committed 1 hour ago',
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                Icon(
                  isSuccess ? Icons.check_circle : Icons.cancel,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
                const Text(' 1/1'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                if (isVerified)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Verified',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                const SizedBox(width: 8),
                const Text(
                  '123456',
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                const Icon(Icons.copy, color: Colors.grey),
                const SizedBox(width: 8),
                const Icon(Icons.upload, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}
