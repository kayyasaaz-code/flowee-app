import 'package:flowee_app/data/dummy_data.dart';
import 'package:flowee_app/state/auth_controller.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/sheet_drag_andle.dart';
import 'package:flutter/material.dart';

//sebagai function (ShowProfileSheet) pendukung ketika user mengeklik sebuah icon button

void ShowProfileSheet(BuildContext context) {
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
    if (!homeContext.mounted) {
      Navigator.of(homeContext).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => Placeholder(),
        ), //arahkan navigasi ke login screen

        //predicate buat menghapus halaman gitu lah
        /**
         * Predicate ini bilang : "hapus semua halaman sebelum nya dari riwayat navigasi".
         * jadi setelah logout, tombol back tidak akan mengemblalikan pengguna ke halaman home
         */
        (route) =>
            false, //pengaturan bahwa jika sudah klik btn logout maka dia tidak akan kembali ke home screen , ini sintak untuk menghapus semua riwayat rute nya
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SheetDragAndle(),
          SizedBox(height: 24),
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primary, AppTheme.primaryDark],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person_rounded, color: Colors.white, size: 34),
          ),
          SizedBox(height: 14),

          //ini buat text demo user
          Text(
            DummyUser.name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          SizedBox(height: 4),

          //ini buat teks email user
          Text(
            DummyUser.email,
            style: TextStyle(fontSize: 13, color: AppTheme.textPrimary),
          ),
          SizedBox(height: 26),
          //buat btn logout
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _logout(context),
              icon: Icon(Icons.logout_rounded, size: 18),
              label: Text("keluar"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryDark,
                side: BorderSide(color: AppTheme.primary),
                padding: EdgeInsets.symmetric(vertical: 14),
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
