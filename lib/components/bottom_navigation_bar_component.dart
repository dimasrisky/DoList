import 'package:dolist/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarComponent extends StatelessWidget {
  final String currentPage;
  const BottomNavigationBarComponent({
    required this.currentPage,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, currentPage == '/home', '/home', context, currentPage),
            _buildNavItem(Icons.check_circle_rounded, false, '/', context, currentPage),
            _buildAddButton(),
            _buildNavItem(Icons.apps, currentPage == '/category' || currentPage == '/category/create', '/category', context, currentPage),
            _buildNavItem(Icons.settings, false, '/', context, currentPage),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive, String redirectUrl, BuildContext context, String currentPage) {
    return GestureDetector(
      onTap: () => {
        if(redirectUrl != currentPage){
          Navigator.pushNamed(context, redirectUrl)
        }
      },
      child: Icon(
        icon,
        color: isActive ? AppColors.secondary : AppColors.grayText,
        size: 28,
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.secondary,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}