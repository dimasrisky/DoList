import 'package:dolist/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.0,
                  children: const [
                    _CategoryCard(
                      icon: Icons.work_outline,
                      title: 'Work',
                      taskCount: '8 Tasks',
                      progress: 0.65,
                      color: Color(0xFF4285F4),
                    ),
                    _CategoryCard(
                      icon: Icons.person_outline,
                      title: 'Personal',
                      taskCount: '3 Tasks',
                      progress: 0.40,
                      color: Color(0xFF9C27B0),
                    ),
                    _CategoryCard(
                      icon: Icons.shopping_cart_outlined,
                      title: 'Shopping',
                      taskCount: '12 Items',
                      progress: 0.75,
                      color: Color(0xFFFF9800),
                    ),
                    _CategoryCard(
                      icon: Icons.favorite_border,
                      title: 'Health',
                      taskCount: '2 Tasks',
                      progress: 0.30,
                      color: Color(0xFFE91E63),
                    ),
                    _CategoryCard(
                      icon: Icons.attach_money,
                      title: 'Finance',
                      taskCount: '4 Tasks',
                      progress: 0.50,
                      color: Color(0xFF4CAF50),
                    ),
                    _AddCategoryCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.search,
                  color: AppColors.primaryText,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: AppColors.primaryText,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
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
            _buildNavItem(
              icon: Icons.check_circle_outline,
              label: 'Tasks',
              isActive: false,
            ),
            _buildNavItem(
              icon: Icons.apps,
              label: 'Categories',
              isActive: true,
            ),
            _buildNavItem(
              icon: Icons.calendar_today_outlined,
              label: 'Calendar',
              isActive: false,
            ),
            _buildNavItem(
              icon: Icons.settings_outlined,
              label: 'Settings',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? AppColors.secondary : AppColors.grayText,
          size: 26,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.secondary : AppColors.grayText,
            fontSize: 12,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String taskCount;
  final double progress;
  final Color color;

  const _CategoryCard({
    required this.icon,
    required this.title,
    required this.taskCount,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: AppColors.grayText,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            taskCount,
            style: TextStyle(
              color: AppColors.grayText,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.primary,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddCategoryCard extends StatelessWidget {
  const _AddCategoryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.grayText.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.grayText.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: AppColors.grayText,
              size: 28,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Add Category',
            style: TextStyle(
              color: AppColors.grayText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
