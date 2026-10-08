import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/voucher_card.dart';

class RewardVoucherScreen extends StatelessWidget {
  const RewardVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rewards & Promo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              const _RewardPointsCard(points: 1250, userTier: 'Gold Member'),
              const SizedBox(height: 28),
              const Text(
                'Voucher Spesial Kamu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 14),
              VoucherCard(
                title: 'Diskon Kopi Pertama 50%',
                discount: 'Potongan 50%',
                minSpend: 'Rp 20.000',
                expiryDate: '30 Okt 2026',
                onClaim: () =>
                    _showVoucherMessage(context, 'Voucher berhasil dipasang!'),
              ),
              VoucherCard(
                title: 'Gratis Ongkir Kopken',
                discount: 'Gratis Ongkir',
                minSpend: 'Rp 35.000',
                expiryDate: '15 Nov 2026',
                onClaim: () => _showVoucherMessage(
                  context,
                  'Voucher Gratis Ongkir dipasang!',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showVoucherMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
  }
}

class _RewardPointsCard extends StatelessWidget {
  const _RewardPointsCard({required this.points, required this.userTier});

  final int points;
  final String userTier;

  static const _primaryColor = Color(0xFF60212D);
  static const _darkColor = Color(0xFF31151A);
  static const _accentColor = Color(0xFFC67C4E);
  static const _goldColor = Color(0xFFE2B062);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [_primaryColor, _darkColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _primaryColor.withOpacity(0.25),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _accentColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  userTier,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.stars_rounded, color: _goldColor, size: 28),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Kopken Points',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '$points',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Pts',
                style: TextStyle(
                  color: _goldColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
