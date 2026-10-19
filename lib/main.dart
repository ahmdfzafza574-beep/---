import 'package:flutter/material.dart';

void main() {
  runApp(const NoorAlQuranApp());
}

class NoorAlQuranApp extends StatelessWidget {
  const NoorAlQuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نور القرآن',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0B1712),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD8B568),
          brightness: Brightness.dark,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color green = Color(0xFF164A32);
  static const Color gold = Color(0xFFE4C477);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0B1712),
          title: const Text(
            'نور القرآن',
            style: TextStyle(
              color: gold,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: gold),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      color: gold,
                      size: 60,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'أهلاً بك في نور القرآن',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'رفيقك في تلاوة القرآن الكريم والتدبر في معانيه',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'أقسام التطبيق',
                style: TextStyle(
                  color: gold,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              _buildSection(
                icon: Icons.menu_book_rounded,
                title: 'القرآن الكريم',
                subtitle: 'قراءة السور والآيات',
                onTap: () {
                  _showMessage(context, 'سنضيف المصحف في الخطوة القادمة');
                },
              ),
              _buildSection(
                icon: Icons.favorite_rounded,
                title: 'الأذكار',
                subtitle: 'أذكار الصباح والمساء',
                onTap: () {
                  _showMessage(context, 'سنضيف الأذكار في مرحلة قادمة');
                },
              ),
              _buildSection(
                icon: Icons.headphones_rounded,
                title: 'التلاوات',
                subtitle: 'الاستماع إلى القرآن الكريم',
                onTap: () {
                  _showMessage(context, 'سنضيف التلاوات الصوتية لاحقاً');
                },
              ),
              _buildSection(
                icon: Icons.auto_stories_rounded,
                title: 'التفسير',
                subtitle: 'فهم معاني الآيات',
                onTap: () {
                  _showMessage(context, 'سنضيف التفسير من مصادر موثوقة');
                },
              ),
              _buildSection(
                icon: Icons.access_time_rounded,
                title: 'مواقيت الصلاة',
                subtitle: 'معرفة مواعيد الصلوات',
                onTap: () {
                  _showMessage(context, 'سنضيف مواقيت الصلاة لاحقاً');
                },
              ),
              _buildSection(
                icon: Icons.explore_rounded,
                title: 'اتجاه القبلة',
                subtitle: 'معرفة اتجاه الكعبة',
                onTap: () {
                  _showMessage(context, 'سنضيف اتجاه القبلة لاحقاً');
                },
              ),
              _buildSection(
                icon: Icons.circle_outlined,
                title: 'السبحة الإلكترونية',
                subtitle: 'التسبيح والذكر',
                onTap: () {
                  _showMessage(context, 'سنضيف السبحة الإلكترونية لاحقاً');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color(0xFF14251C),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: gold.withValues(alpha: 0.25),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Icon(
          icon,
          color: gold,
          size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: gold,
          size: 18,
        ),
        onTap: onTap,
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}