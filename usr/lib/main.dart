import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'السيرة الذاتية',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // فرض اتجاه النص من اليمين لليسار لدعم اللغة العربية
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => const CVScreen(),
      },
    );
  }
}

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              // تصميم الشاشات الكبيرة (ويب/ديسكتوب)
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: _buildSidebar(context),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32.0),
                      child: _buildMainContent(context),
                    ),
                  ),
                ],
              );
            } else {
              // تصميم الهواتف
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      padding: const EdgeInsets.all(24.0),
                      child: _buildSidebar(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: _buildMainContent(context),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.person, size: 80, color: Colors.white),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            'أحمد محمد',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'مطور برمجيات',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        const SizedBox(height: 32),
        _buildSectionTitle(context, 'التواصل'),
        _buildContactItem(Icons.email, 'ahmed@example.com'),
        _buildContactItem(Icons.phone, '+966 50 000 0000'),
        _buildContactItem(Icons.location_on, 'الرياض، المملكة العربية السعودية'),
        _buildContactItem(Icons.link, 'linkedin.com/in/ahmed'),
        const SizedBox(height: 32),
        _buildSectionTitle(context, 'المهارات'),
        _buildSkillItem('تطوير تطبيقات الموبايل (Flutter)'),
        _buildSkillItem('برمجة واجهات الويب (React, Vue)'),
        _buildSkillItem('تطوير النظم الخلفية (Node.js, Python)'),
        _buildSkillItem('إدارة قواعد البيانات (SQL, NoSQL)'),
        _buildSkillItem('حل المشكلات والخوارزميات'),
        const SizedBox(height: 32),
        _buildSectionTitle(context, 'اللغات'),
        _buildSkillItem('العربية (اللغة الأم)'),
        _buildSkillItem('الإنجليزية (ممتاز)'),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'نبذة شخصية'),
        const Text(
          'مطور برمجيات شغوف ومبدع مع خبرة تزيد عن 5 سنوات في تصميم وتطوير تطبيقات الويب والهواتف الذكية. أمتلك القدرة على تحويل الأفكار المعقدة إلى حلول برمجية سلسة وفعالة. أسعى دائماً لتعلم التقنيات الجديدة وتطبيق أفضل الممارسات في كتابة الكود لبناء أنظمة قابلة للتوسع والصيانة.',
          style: TextStyle(fontSize: 16, height: 1.6),
        ),
        const SizedBox(height: 32),
        _buildSectionTitle(context, 'الخبرة المهنية'),
        _buildExperienceItem(
          title: 'مهندس برمجيات أول',
          company: 'شركة التقنية المتقدمة',
          date: '2020 - الحاضر',
          description:
              'قيادة فريق تطوير تطبيقات الهواتف الذكية باستخدام Flutter. تحسين أداء التطبيقات بنسبة 40% وتقليل وقت التحميل. المساهمة في تصميم البنية التحتية للنظام واختيار التقنيات المناسبة.',
        ),
        const SizedBox(height: 16),
        _buildExperienceItem(
          title: 'مطور واجهات أمامية',
          company: 'مؤسسة الحلول الرقمية',
          date: '2017 - 2020',
          description:
              'تطوير وتحديث واجهات الويب لمجموعة من المشاريع الحكومية والخاصة باستخدام React و Angular. التعاون مع فريق التصميم لضمان أفضل تجربة مستخدم (UX/UI).',
        ),
        const SizedBox(height: 32),
        _buildSectionTitle(context, 'التعليم'),
        _buildExperienceItem(
          title: 'بكالوريوس في علوم الحاسب',
          company: 'جامعة الملك سعود',
          date: '2013 - 2017',
          description: 'تخرجت بمرتبة الشرف الأولى. ركزت في دراستي على هندسة البرمجيات وهيكلة البيانات.',
        ),
        const SizedBox(height: 32),
        _buildSectionTitle(context, 'المشاريع البارزة'),
        _buildProjectItem(
          title: 'تطبيق إدارة المهام المتكامل',
          description: 'تطبيق متوفر على منصتي Android و iOS تم بناؤه باستخدام Flutter ومربوط بقاعدة بيانات Supabase، يساعد المستخدمين على تنظيم وقتهم وزيادة الإنتاجية.',
        ),
        const SizedBox(height: 16),
        _buildProjectItem(
          title: 'منصة التجارة الإلكترونية',
          description: 'منصة ويب متكاملة تتيح للتجار عرض منتجاتهم، تدعم الدفع الإلكتروني وتتبع الطلبات باستخدام تقنيات حديثة.',
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 3,
            width: 40,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(String skill) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              skill,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String date,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              date,
              style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          company,
          style: const TextStyle(fontSize: 16, color: Colors.blueGrey, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildProjectItem({required String title, required String description}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blueGrey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}
