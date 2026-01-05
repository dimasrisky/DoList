import 'dart:math';

import 'package:dolist/components/bottom_navigation_bar_component.dart';
import 'package:dolist/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    List<dynamic> categories = Hive.box('categories').values.toList();
    
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildStatusCards(categories.length.toString()),
                const SizedBox(height: 24),
                _buildTodaysFocusCard(),
                const SizedBox(height: 24),
                _buildActivityCard(),
                const SizedBox(height: 24),
                _buildCategoriesCard(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(currentPage: '/home'),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TUESDAY, OCT 24',
              style: TextStyle(
                color: AppColors.grayText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Dashboard',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.gray,
            border: Border.all(
              color: AppColors.secondary,
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.person,
            color: AppColors.primaryText,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCards(String totalCategories) {
    return Row(
      children: [
        Expanded(
          child: _StatusCard(
            label: 'Category',
            count: totalCategories,
            isActive: false,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatusCard(
            label: 'Task',
            count: '5',
            isActive: true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatusCard(
            label: 'Completed',
            count: '28',
            isActive: false,
          ),
        ),
      ],
    );
  }

  Widget _buildTodaysFocusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Focus",
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Complete your priority tasks',
            style: TextStyle(
              color: AppColors.grayText,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '65%',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.65,
                        backgroundColor: AppColors.primary,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.secondary,
                        ),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '8 Tasks',
                    style: TextStyle(
                      color: AppColors.grayText,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '5 Completed',
                    style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard() {
    return Container(
      padding: const EdgeInsets.all(20),
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
              const Text(
                'Activity',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Weekly',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: CustomPaint(
              painter: _ActivityChartPainter(),
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CustomPaint(
                  painter: _DonutChartPainter(),
                  child: const SizedBox.expand(),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategoryItem('Work', '60%', AppColors.secondary),
                    const SizedBox(height: 16),
                    _buildCategoryItem('Personal', '25', AppColors.grayText),
                    const SizedBox(height: 16),
                    _buildCategoryItem('Other', '15%', AppColors.grayText),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String label, String percentage, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Text(
          percentage,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String count;
  final bool isActive;

  const _StatusCard({
    required this.label,
    required this.count,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: isActive ? AppColors.secondary : AppColors.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.primaryText,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white70 : AppColors.grayText,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final data = [0.3, 0.5, 0.4, 0.8, 0.6, 0.7, 0.5];

    final linePaint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = AppColors.secondary.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final pointPaint = Paint()
      ..color = AppColors.secondary
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height - 20;
    final stepX = width / (days.length - 1);

    final points = <Offset>[];
    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final y = height - (data[i] * height);
      points.add(Offset(x, y));
    }

    final path = Path()..moveTo(points.first.dx, height);
    for (final point in points) {
      path.lineTo(point.dx, point.dy);
    }
    path.lineTo(points.last.dx, height);
    path.close();

    canvas.drawPath(path, fillPaint);

    final linePath = Path();
    linePath.moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      linePath.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(linePath, linePaint);

    for (int i = 0; i < points.length; i++) {
      canvas.drawCircle(points[i], 6, pointPaint);
      canvas.drawCircle(points[i], 6,
        Paint()
          ..color = AppColors.gray
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: days[i],
          style: TextStyle(
            color: AppColors.grayText,
            fontSize: 12,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          points[i].dx - textPainter.width / 2,
          height + 8,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    final startAngle = -pi / 2;

    final workAngle = (2 * pi) * 0.60;
    strokePaint.color = AppColors.secondary;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      workAngle,
      false,
      strokePaint,
    );

    final personalAngle = (2 * pi) * 0.25;
    strokePaint.color = AppColors.grayText;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + workAngle + 0.2,
      personalAngle,
      false,
      strokePaint,
    );

    final otherAngle = (2 * pi) * 0.15;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + workAngle + personalAngle + 0.4,
      otherAngle,
      false,
      strokePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
