import 'package:dolist/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/v4.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  final TextEditingController _titleController = TextEditingController();
  int _selectedColorIndex = 0;
  int _selectedIconIndex = 0;

  final List<Color> _colors = const [
    Color(0xFF4285F4), // Blue
    Color(0xFFEA4335), // Red
    Color(0xFFFF9800), // Orange
    Color(0xFFFBBC05), // Yellow
    Color(0xFF34A853), // Green
    Color(0xFF9C27B0), // Purple
    Color(0xFFE91E63), // Pink
  ];

  final List<IconData> _icons = const [
    Icons.folder_outlined,
    Icons.shopping_bag_outlined,
    Icons.shopping_cart_outlined,
    Icons.school_outlined,
    Icons.flight_outlined,
    Icons.trending_up_outlined,
    Icons.menu_book_outlined,
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.more_horiz,
    Icons.star_border,
    Icons.crop_square_outlined,
  ];

  void submitCategory(String title, Color color, IconData icon){
    final categoryBox = Hive.box('categories');
    String uuid = UuidV4().generate();

    categoryBox.put(uuid, { 'id': uuid, 'title': title, 'color': color.toARGB32(), 'icon': icon.codePoint });

    Navigator.pushNamed(context, '/category');
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/category');
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        title: const Text(
          'New Category',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Handle create category
              Navigator.pop(context);
            },
            child: GestureDetector(
              onTap: () => submitCategory(_titleController.text, _colors[_selectedColorIndex], _icons[_selectedIconIndex]),
              child: Text(
              'Done',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Give your new list a name.',
                style: TextStyle(
                  color: AppColors.grayText,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _titleController,
                  style: const TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Category Name',
                    hintStyle: TextStyle(
                      color: AppColors.grayText,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Color',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildColorSelector(),
              const SizedBox(height: 32),
              const Text(
                'Icon',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildIconSelector(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildColorSelector() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: List.generate(_colors.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColorIndex = index;
              });
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _colors[index],
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedColorIndex == index
                      ? AppColors.primaryText
                      : Colors.transparent,
                  width: 3,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIconSelector() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
        children: List.generate(_icons.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIconIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _selectedIconIndex == index
                    ? AppColors.secondary.withValues(alpha: 0.2)
                    : AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedIconIndex == index
                      ? AppColors.secondary
                      : AppColors.grayText.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: Icon(
                _icons[index],
                color: _selectedIconIndex == index
                    ? AppColors.secondary
                    : AppColors.primaryText,
                size: 24,
              ),
            ),
          );
        }),
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
            _buildNavItem(Icons.home_outlined, false),
            _buildNavItem(Icons.search_outlined, false),
            _buildAddButton(),
            _buildNavItem(Icons.calendar_today_outlined, false),
            _buildNavItem(Icons.person_outline, false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Icon(
      icon,
      color: isActive ? AppColors.secondary : AppColors.grayText,
      size: 26,
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
