import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../screen/login_screen.dart';
import '../state/auth_controller.dart';
import '../theme/app_theme.dart';
import 'sheet_drag_andle.dart';

// Sebagai function (showProfileSheet) pendukung ketika user mengeklik sebuah icon button
void showProfileSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) => _ProfileSheetContent(homeContext: context),
  );
}

class _ProfileSheetContent extends StatelessWidget {
  const _ProfileSheetContent({required this.homeContext});

  final BuildContext homeContext;

  Future<void> _logout(BuildContext sheetContext) async {
    Navigator.of(sheetContext).pop();
    await AuthController.instance.logout();
    if (homeContext.mounted) {
      Navigator.of(homeContext).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetDragAndle(),
          const SizedBox(height: 24),
          Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.primaryDark],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(height: 14),

          // Teks name demo user
          Text(
            DummyUser.name,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),

          // Teks email user
          Text(
            DummyUser.email,
            style: const TextStyle(fontSize: 13, color: AppTheme.textPrimary),
          ),
          const SizedBox(height: 26),

          // Button logout
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _logout(context),
              icon: const Icon(Icons.logout_rounded, size: 18),
              label: const Text("Keluar"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryDark,
                side: const BorderSide(color: AppTheme.primary),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
