import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:zabet_app/core/app_colors.dart';

const String _defaultBannerAdUnitId = 'ca-app-pub-8862179519549672~8588182749';

class _ZabetBannerFooter extends StatefulWidget {
  final String adUnitId;

  const _ZabetBannerFooter({
    required this.adUnitId,
  });

  @override
  State<_ZabetBannerFooter> createState() => _ZabetBannerFooterState();
}

class _ZabetBannerFooterState extends State<_ZabetBannerFooter> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
    _isAdLoaded = false;

    final banner = BannerAd(
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          debugPrint("BannerAd failed to load: ${err.message}");
          if (mounted) {
            setState(() {
              _bannerAd = null;
              _isAdLoaded = false;
            });
          }
        },
      ),
    );

    banner.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BannerAd? activeBanner = _bannerAd;
    if (!_isAdLoaded || activeBanner == null) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        width: activeBanner.size.width.toDouble(),
        height: activeBanner.size.height.toDouble(),
        child: AdWidget(ad: activeBanner),
      ),
    );
  }
}

// 1. شاشة التمارين
class WorkoutsScreen extends StatelessWidget {
  final String bannerAdUnitId;

  const WorkoutsScreen({
    Key? key,
    this.bannerAdUnitId = _defaultBannerAdUnitId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Zabet Workouts')),
      body: const Center(
        child: Text(
          'صفحة التمارين والجدول قريباً',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      bottomNavigationBar: _ZabetBannerFooter(adUnitId: bannerAdUnitId),
    );
  }
}

// 2. شاشة التايمر (العداد الخاص بيك)
class TimerScreen extends StatelessWidget {
  final String bannerAdUnitId;

  const TimerScreen({
    Key? key,
    this.bannerAdUnitId = _defaultBannerAdUnitId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Zabet Timer')),
      body: const Center(
        child: Text(
          'شاشة عداد الراحة بين المجموعات',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      bottomNavigationBar: _ZabetBannerFooter(adUnitId: bannerAdUnitId),
    );
  }
}

// 3. شاشة الدايت والتغذية
class DietScreen extends StatelessWidget {
  final String bannerAdUnitId;

  const DietScreen({
    Key? key,
    this.bannerAdUnitId = _defaultBannerAdUnitId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Zabet Diet')),
      body: const Center(
        child: Text(
          'صفحة حساب السعرات والوجبات',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      bottomNavigationBar: _ZabetBannerFooter(adUnitId: bannerAdUnitId),
    );
  }
}

// 4. شاشة الاختبارات البدنية
class TestsScreen extends StatelessWidget {
  final String bannerAdUnitId;

  const TestsScreen({
    Key? key,
    this.bannerAdUnitId = _defaultBannerAdUnitId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Zabet Tests')),
      body: const Center(
        child: Text(
          'متابعة أرقام الضغط، العقلة، والجري',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      bottomNavigationBar: _ZabetBannerFooter(adUnitId: bannerAdUnitId),
    );
  }
}

// 5. شاشة تأهيل الكليات العسكرية
class AcademyPrepScreen extends StatelessWidget {
  final String bannerAdUnitId;

  const AcademyPrepScreen({
    Key? key,
    this.bannerAdUnitId = _defaultBannerAdUnitId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Academy Prep')),
      body: const Center(
        child: Text(
          'خطة التأهيل البدني والنفسي للكليات',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      bottomNavigationBar: _ZabetBannerFooter(adUnitId: bannerAdUnitId),
    );
  }
}