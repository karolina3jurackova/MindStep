import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adv_basics/Shapes/shape_profile.dart';
import 'package:adv_basics/models/user_model.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:adv_basics/services/notification_service.dart';
import 'package:google_fonts/google_fonts.dart';

// ── Design tokens ─────────────────────────────────────────────

const _ink = Color(0xFF40260A);
const _inkMid = Color(0xFF6E3E09);
const _inkSoft = Color(0xFF9E7A50);
const _amber = Color(0xFFC87A3A);
const _amberLight = Color(0xFFE39A5C);
const _sage = Color(0xFF9DAE7A);
const _surface = Color(0xFFFDF3E2);
const _line = Color(0xFFE8D5BC);
const _sheetBg = Color(0xFFFFF6EB);

// ── Helpers ───────────────────────────────────────────────────

String _authErrorMessage(String code) {
  switch (code) {
    case 'wrong-password':
      return 'Nesprávné heslo.';
    case 'too-many-requests':
      return 'Příliš mnoho pokusů. Zkus to znovu později.';
    case 'weak-password':
      return 'Heslo je příliš slabé (min. 6 znaků).';
    default:
      return 'Něco se pokazilo. Zkus to znovu.';
  }
}

void _showSheet(BuildContext context, Widget sheet) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => sheet,
  );
}

// ── SettingsScreen ────────────────────────────────────────────

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 232, 205),
      body: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: ShapeFocus())),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, screenHeight * 0.22, 24, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Profil',
                      style: GoogleFonts.judson(
                          color: _ink,
                          fontSize: 38,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 14),
                  _ProfileHeader(user: user),
                  const SizedBox(height: 20),
                  _SettingsCard(user: user),
                  const SizedBox(height: 14),
                  _LogoutButton(),
                ],
              ),
            ),
          ),
          _NavBar(),
        ],
      ),
    );
  }
}

// ── Profile header ────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  final User? user;
  const _ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: FirestoreService().streamUserData(),
      builder: (context, snap) {
        final avatar = snap.data?.avatarAsset ?? 'avatar1.png';
        return Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 242, 231),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: _line),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Image.asset(
                  'assets/images/$avatar',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.displayName?.isNotEmpty == true
                        ? user!.displayName!
                        : 'MindStep User',
                    style: GoogleFonts.judson(
                        color: _ink,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 1.1),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    user?.email ?? '',
                    style: GoogleFonts.judson(
                        color: const Color.fromARGB(255, 122, 92, 57),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// ── Settings card with rows ───────────────────────────────────

class _SettingsCard extends StatelessWidget {
  final User? user;
  const _SettingsCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 253, 236, 216),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        children: [
          _SettingsRow(
            icon: Icons.person_outline,
            title: 'Spravovat profil',
            subtitle: 'Jméno, avatar, e-mail',
            onTap: () => _showSheet(context, const _ManageProfileSheet()),
          ),
          const _Divider(),
          _SettingsRow(
            icon: Icons.lock_outline,
            title: 'Zabezpečení',
            subtitle: 'Heslo a soukromí',
            onTap: () => _showSheet(context, const _SecuritySheet()),
          ),
          const _Divider(),
          _SettingsRow(
            icon: Icons.notifications_outlined,
            title: 'Oznámení',
            subtitle: 'Tichá hodiny a připomínky',
            onTap: () => _showSheet(context, const _NotificationsSheet()),
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SettingsRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: _surface, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, size: 22, color: _inkMid),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.judson(
                          color: _ink, fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 1),
                  Text(subtitle,
                      style: GoogleFonts.josefinSans(
                          color: _inkSoft,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right,
                size: 16, color: Color.fromARGB(255, 93, 58, 18)),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();
  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(height: 1, color: _line),
      );
}

// ── Logout button ─────────────────────────────────────────────

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          if (context.mounted) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (_) => false);
          }
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          side: const BorderSide(color: _line, width: 1.5),
          foregroundColor: const Color.fromARGB(255, 107, 76, 41),
        ),
        child: Text('Odhlásit se',
            style: GoogleFonts.josefinSans(
                fontSize: 17, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

// ── Nav bar ───────────────────────────────────────────────────

class _NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottom = bottomInset > 0 ? bottomInset : 22.0;

    return Positioned(
      left: 16,
      right: 16,
      bottom: bottom,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 66,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 254, 211, 165)
                  .withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(24),
              border:
                  Border.all(color: _line.withValues(alpha: 0.5), width: 1),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF2C1E0C).withValues(alpha: 0.08),
                    blurRadius: 30,
                    offset: const Offset(0, 8)),
                BoxShadow(
                    color: const Color(0xFF2C1E0C).withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(icon: Icons.home_outlined, isActive: false,
                      onTap: () => Navigator.pushReplacementNamed(context, '/home')),
                  _NavItem(icon: Icons.calendar_month_outlined, isActive: false,
                      onTap: () => Navigator.pushReplacementNamed(context, '/calendar')),
                  _NavItem(icon: Icons.bar_chart, isActive: false,
                      onTap: () => Navigator.pushReplacementNamed(context, '/statistic')),
                  _NavItem(icon: Icons.settings_outlined, isActive: true,
                      onTap: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem(
      {required this.icon, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const activeColor = Color.fromARGB(255, 130, 74, 29);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isActive
              ? const Color.fromARGB(255, 232, 125, 38).withValues(alpha: 0.24)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, size: 22, color: isActive ? activeColor : _inkSoft),
      ),
    );
  }
}

// ── Shared sheet container ────────────────────────────────────

class _SheetContainer extends StatelessWidget {
  final Widget child;
  const _SheetContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: const BoxDecoration(
        color: _sheetBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.fromLTRB(24, 12, 24, bottom + 32),
      child: child,
    );
  }
}

Widget _sheetHandle() => Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
            color: _line, borderRadius: BorderRadius.circular(2)),
      ),
    );

Widget _sheetTitle(String text) => Text(text,
    style: GoogleFonts.judson(
        color: _ink, fontSize: 24, fontWeight: FontWeight.bold));

// ── Shared styled field ───────────────────────────────────────

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? prefix;
  final void Function(String) onChanged;

  const _Field({
    required this.label,
    required this.controller,
    required this.onChanged,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.josefinSans(
                color: _inkSoft,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5)),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _line),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: GoogleFonts.judson(color: _ink, fontSize: 16),
            decoration: InputDecoration(
              prefixText: prefix,
              prefixStyle: GoogleFonts.judson(color: _inkSoft, fontSize: 16),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Save status indicator ─────────────────────────────────────

enum _SaveStatus { idle, saving, saved }

class _StatusIndicator extends StatelessWidget {
  final _SaveStatus status;
  const _StatusIndicator({required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == _SaveStatus.saving) {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(strokeWidth: 2, color: _amber)),
        const SizedBox(width: 6),
        Text('Ukládám…',
            style: GoogleFonts.josefinSans(color: _inkSoft, fontSize: 12)),
      ]);
    }
    if (status == _SaveStatus.saved) {
      return Row(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.check_circle_outline, size: 14, color: _sage),
        const SizedBox(width: 6),
        Text('Uloženo',
            style: GoogleFonts.josefinSans(color: _sage, fontSize: 12)),
      ]);
    }
    return const SizedBox.shrink();
  }
}

// ── Manage Profile sheet ──────────────────────────────────────

class _ManageProfileSheet extends StatefulWidget {
  const _ManageProfileSheet();
  @override
  State<_ManageProfileSheet> createState() => _ManageProfileSheetState();
}

class _ManageProfileSheetState extends State<_ManageProfileSheet> {
  static const _avatars = [
    'avatar1.png',
    'avatar2.png',
    'avatar3.png',
    'avatar4.png',
  ];

  final _user = FirebaseAuth.instance.currentUser;
  late final TextEditingController _nameCtrl;
  late final TextEditingController _usernameCtrl;
  late final TextEditingController _emailCtrl;
  Timer? _saveTimer;
  _SaveStatus _status = _SaveStatus.idle;
  String _selectedAvatar = 'avatar1.png';

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: _user?.displayName ?? '');
    _emailCtrl = TextEditingController(text: _user?.email ?? '');
    _usernameCtrl = TextEditingController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    if (_user == null) return;
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .get();
    final data = doc.data();
    if (data == null || !mounted) return;
    setState(() {
      _usernameCtrl.text = (data['username'] as String?) ?? '';
      _selectedAvatar = (data['avatarAsset'] as String?) ?? 'avatar1.png';
    });
  }

  Future<void> _selectAvatar(String asset) async {
    setState(() {
      _selectedAvatar = asset;
      _status = _SaveStatus.saving;
    });
    await FirestoreService().saveAvatar(asset);
    if (!mounted) return;
    setState(() => _status = _SaveStatus.saved);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _status = _SaveStatus.idle);
  }

  void _autoSave(Future<void> Function() fn) {
    _saveTimer?.cancel();
    setState(() => _status = _SaveStatus.saving);
    _saveTimer = Timer(const Duration(milliseconds: 800), () async {
      try {
        await fn();
        if (mounted) setState(() => _status = _SaveStatus.saved);
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) setState(() => _status = _SaveStatus.idle);
      } catch (_) {
        if (mounted) setState(() => _status = _SaveStatus.idle);
      }
    });
  }

  Future<void> _changeEmail() async {
    final pwCtrl = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => _StyledDialog(
        title: 'Potvrdit heslo',
        content: _PasswordField(controller: pwCtrl),
        confirmLabel: 'Potvrdit',
        confirmColor: _amber,
      ),
    );
    if (confirmed != true || _user?.email == null) return;
    try {
      final cred = EmailAuthProvider.credential(
          email: _user!.email!, password: pwCtrl.text);
      await _user!.reauthenticateWithCredential(cred);
      await _user!.verifyBeforeUpdateEmail(_emailCtrl.text.trim());
      if (mounted) {
        _showSnack(context, 'Ověřovací e-mail byl odeslán — zkontroluj schránku.',
            color: _sage);
      }
    } catch (e) {
      if (mounted) _showSnack(context, e.toString(), color: Colors.redAccent);
    }
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    _nameCtrl.dispose();
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SheetContainer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _sheetHandle(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sheetTitle('Upravit profil'),
                _StatusIndicator(status: _status),
              ],
            ),
            const SizedBox(height: 24),
            // ── Avatar preview ─────────────────────────────────
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Container(
                  key: ValueKey(_selectedAvatar),
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: _amber, width: 2.5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.asset(
                      'assets/images/$_selectedAvatar',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ── Avatar picker ──────────────────────────────────
            Text('Vybrat avatar',
                style: GoogleFonts.josefinSans(
                    color: _inkSoft,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _avatars.map((asset) {
                final selected = asset == _selectedAvatar;
                return GestureDetector(
                  onTap: () => _selectAvatar(asset),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selected ? _amber : _line,
                        width: selected ? 2.5 : 1.5,
                      ),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: _amber.withValues(alpha: 0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              )
                            ]
                          : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.5),
                      child: Image.asset(
                        'assets/images/$asset',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 28),
            _Field(
              label: 'Jméno',
              controller: _nameCtrl,
              onChanged: (v) => _autoSave(() => _user!.updateDisplayName(v)),
            ),
            const SizedBox(height: 14),
            _Field(
              label: 'Uživatelské jméno',
              controller: _usernameCtrl,
              prefix: '@',
              onChanged: (v) => _autoSave(() => FirebaseFirestore.instance
                  .collection('users')
                  .doc(_user!.uid)
                  .set({'username': v}, SetOptions(merge: true))),
            ),
            const SizedBox(height: 14),
            _EmailField(controller: _emailCtrl, onChangeTap: _changeEmail),
          ],
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChangeTap;
  const _EmailField({required this.controller, required this.onChangeTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('E-mail',
            style: GoogleFonts.josefinSans(
                color: _inkSoft,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5)),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _line),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: true,
                  style: GoogleFonts.judson(color: _ink, fontSize: 16),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onChangeTap,
                child: const Padding(
                  padding: EdgeInsets.only(right: 14),
                  child:
                      Icon(Icons.lock_outline, size: 18, color: _inkSoft),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text('Klepni na 🔒 pro změnu — vyžaduje potvrzení hesla',
            style: GoogleFonts.josefinSans(
                color: _inkSoft, fontWeight: FontWeight.w600, fontSize: 13)),
      ],
    );
  }
}

// ── Security sheet ────────────────────────────────────────────

class _SecuritySheet extends StatefulWidget {
  const _SecuritySheet();
  @override
  State<_SecuritySheet> createState() => _SecuritySheetState();
}

class _SecuritySheetState extends State<_SecuritySheet> {
  final _oldPwCtrl = TextEditingController();
  final _newPwCtrl = TextEditingController();
  bool _oldVisible = false;
  bool _newVisible = false;
  bool _changing = false;
  String? _pwError;

  @override
  void dispose() {
    _oldPwCtrl.dispose();
    _newPwCtrl.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.email == null) return;
    setState(() {
      _changing = true;
      _pwError = null;
    });
    try {
      await user.reauthenticateWithCredential(
          EmailAuthProvider.credential(
              email: user.email!, password: _oldPwCtrl.text));
      if (_newPwCtrl.text.length < 6) {
        setState(() {
          _pwError = 'Nové heslo musí mít alespoň 6 znaků.';
          _changing = false;
        });
        return;
      }
      await user.updatePassword(_newPwCtrl.text);
      _oldPwCtrl.clear();
      _newPwCtrl.clear();
      if (mounted) {
        _showSnack(context, 'Heslo bylo aktualizováno.', color: _sage);
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _pwError = _authErrorMessage(e.code));
    } finally {
      if (mounted) setState(() => _changing = false);
    }
  }

  Future<void> _deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => _StyledDialog(
        title: 'Smazat účet?',
        message:
            'Tímto trvale smažeš všechna svá data. Tuto akci nelze vrátit.',
        confirmLabel: 'Smazat',
        confirmColor: Colors.red,
      ),
    );
    if (confirmed != true) return;

    final pwCtrl = TextEditingController();
    final pw = await showDialog<String>(
      context: context,
      builder: (ctx) => _StyledDialog(
        title: 'Potvrdit heslo',
        content: _PasswordField(controller: pwCtrl),
        confirmLabel: 'Potvrdit',
        confirmColor: Colors.red,
        onConfirm: () => Navigator.pop(ctx, pwCtrl.text),
      ),
    );
    if (pw == null || pw.isEmpty) return;

    try {
      await user.reauthenticateWithCredential(
          EmailAuthProvider.credential(email: user.email!, password: pw));

      final db = FirebaseFirestore.instance;
      final entries = await db
          .collection('users')
          .doc(user.uid)
          .collection('entries')
          .get();
      final batch = db.batch()
        ..delete(db.collection('users').doc(user.uid));
      for (final doc in entries.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
      await user.delete();

      if (mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (_) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        _showSnack(context, _authErrorMessage(e.code),
            color: Colors.redAccent);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _SheetContainer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sheetHandle(),
            const SizedBox(height: 20),
            _sheetTitle('Zabezpečení'),
            const SizedBox(height: 24),
            _SectionLabel('Změna hesla'),
            const SizedBox(height: 12),
            _PwField(
              label: 'Aktuální heslo',
              controller: _oldPwCtrl,
              visible: _oldVisible,
              onToggle: () => setState(() => _oldVisible = !_oldVisible),
            ),
            const SizedBox(height: 10),
            _PwField(
              label: 'Nové heslo',
              controller: _newPwCtrl,
              visible: _newVisible,
              onToggle: () => setState(() => _newVisible = !_newVisible),
            ),
            if (_pwError != null) ...[
              const SizedBox(height: 6),
              Text(_pwError!,
                  style: GoogleFonts.josefinSans(
                      color: Colors.redAccent, fontSize: 12)),
            ],
            const SizedBox(height: 16),
            _PrimaryButton(
              label: 'Aktualizovat heslo',
              loading: _changing,
              onPressed: _changePassword,
            ),
            const SizedBox(height: 32),
            const Divider(color: _line),
            const SizedBox(height: 12),
            Text('Nebezpečná zóna',
                style: GoogleFonts.judson(
                    color: Colors.redAccent,
                    fontSize: 19,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(
              'Smazání účtu je nevratné. '
              'Všechna tvá data budou trvale vymazána (GDPR čl. 17).',
              style: GoogleFonts.josefinSans(
                  color: _inkSoft, fontWeight: FontWeight.w500, fontSize: 12),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _deleteAccount,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  side:
                      const BorderSide(color: Colors.redAccent, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: Text('Smazat můj účet',
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w700, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Notifications sheet ───────────────────────────────────────

class _NotificationsSheet extends StatefulWidget {
  const _NotificationsSheet();
  @override
  State<_NotificationsSheet> createState() => _NotificationsSheetState();
}

class _NotificationsSheetState extends State<_NotificationsSheet> {
  static const _defaults = NotifSettings(
    morningEnabled: false,
    afternoonEnabled: false,
    eveningEnabled: false,
    communicationEnabled: false,
  );

  NotifSettings _settings = _defaults;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    NotificationService.instance.loadSettings().then((s) {
      if (mounted) setState(() {
        _settings = s;
        _loading = false;
      });
    });
  }

  Future<void> _save(NotifSettings s) async {
    setState(() => _settings = s);
    await NotificationService.instance.persistSettings(s);
    if (s.anyEnabled) await NotificationService.instance.requestPermission();
    await NotificationService.instance.applySettings(s);
  }

  @override
  Widget build(BuildContext context) {
    return _SheetContainer(
      child: _loading
          ? const Padding(
              padding: EdgeInsets.all(40),
              child: Center(child: CircularProgressIndicator(color: _amber)))
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sheetHandle(),
                  const SizedBox(height: 20),
                  _sheetTitle('Oznámení'),
                  const SizedBox(height: 6),
                  Text(
                    'Zvol, kdy chceš dostávat připomínky.',
                    style: GoogleFonts.josefinSans(
                        color: _inkSoft, fontSize: 13),
                  ),
                  const SizedBox(height: 24),
                  const _SectionLabel('OBECNÉ'),
                  _ToggleRow(
                    title: 'Ráno',
                    subtitle: '09:00 · "Začni svůj den 🌱"',
                    value: _settings.morningEnabled,
                    onChanged: (v) =>
                        _save(_settings.copyWith(morningEnabled: v)),
                  ),
                  _ToggleRow(
                    title: 'Odpoledne',
                    subtitle: '13:00 · "Dnes je ještě čas ⏰"',
                    value: _settings.afternoonEnabled,
                    onChanged: (v) =>
                        _save(_settings.copyWith(afternoonEnabled: v)),
                  ),
                  _ToggleRow(
                    title: 'Večer',
                    subtitle: '19:00 · "Jak ti to šlo dnes? 🌙"',
                    value: _settings.eveningEnabled,
                    onChanged: (v) =>
                        _save(_settings.copyWith(eveningEnabled: v)),
                  ),
                  const SizedBox(height: 16),
                  const _SectionLabel('KOMUNIKACE'),
                  _ToggleRow(
                    title: 'Připomínka úkolu',
                    subtitle: '13:30 · Dnešní komunikační výzva',
                    value: _settings.communicationEnabled,
                    onChanged: (v) =>
                        _save(_settings.copyWith(communicationEnabled: v)),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
    );
  }
}

// ── Small reusable widgets ────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(text,
            style: GoogleFonts.josefinSans(
                color: _inkSoft,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8)),
      );
}

class _Toggle extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  const _Toggle({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 50,
        height: 28,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          color: value ? _amberLight : _line,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment:
              value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 2,
                    offset: Offset(0, 1))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool) onChanged;

  const _ToggleRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.judson(
                        color: _ink,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: GoogleFonts.josefinSans(
                        color: _inkSoft,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          _Toggle(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class _PwField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool visible;
  final VoidCallback onToggle;
  const _PwField({
    required this.label,
    required this.controller,
    required this.visible,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.josefinSans(
                color: _inkSoft,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5)),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: _surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: _line),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: !visible,
                  style: GoogleFonts.judson(color: _ink, fontSize: 16),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onToggle,
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Icon(
                    visible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 18,
                    color: _inkSoft,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onPressed;
  const _PrimaryButton(
      {required this.label,
      required this.loading,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _amber,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
          elevation: 0,
        ),
        child: loading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white))
            : Text(label,
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.w700, fontSize: 15)),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  const _PasswordField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      style: GoogleFonts.judson(color: _ink),
      decoration: InputDecoration(
        labelText: 'Aktuální heslo',
        labelStyle: GoogleFonts.josefinSans(color: _inkSoft),
        filled: true,
        fillColor: _surface,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }
}

class _StyledDialog extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? content;
  final String confirmLabel;
  final Color confirmColor;
  final VoidCallback? onConfirm;

  const _StyledDialog({
    required this.title,
    this.message,
    this.content,
    required this.confirmLabel,
    required this.confirmColor,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _sheetBg,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(title,
          style: GoogleFonts.judson(
              color: _ink, fontSize: 20, fontWeight: FontWeight.bold)),
      content: message != null
          ? Text(message!,
              style:
                  GoogleFonts.josefinSans(color: _inkSoft, fontSize: 13))
          : content,
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Zrušit',
                style: GoogleFonts.josefinSans(color: _inkSoft))),
        TextButton(
            onPressed:
                onConfirm ?? () => Navigator.pop(context, true),
            child: Text(confirmLabel,
                style: GoogleFonts.josefinSans(
                    color: confirmColor, fontWeight: FontWeight.w700))),
      ],
    );
  }
}

// ── Snackbar helper ───────────────────────────────────────────

void _showSnack(BuildContext context, String message, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: GoogleFonts.josefinSans()),
    backgroundColor: color,
  ));
}
