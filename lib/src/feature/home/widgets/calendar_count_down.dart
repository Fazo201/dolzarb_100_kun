import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarCountdown extends StatefulWidget {
  const CalendarCountdown({super.key});

  @override
  State<CalendarCountdown> createState() => _CalendarCountdownState();
}

class _CalendarCountdownState extends State<CalendarCountdown> {
  static const _storageKey = 'target_date';

  DateTime? _targetDate;
  Duration _remaining = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadTargetDate();
  }

  /// 🔹 Local storage dan targetDate o‘qiladi
  Future<void> _loadTargetDate() async {
    final prefs = await SharedPreferences.getInstance();
    final millis = prefs.getInt(_storageKey);

    if (millis != null) {
      _targetDate = DateTime.fromMillisecondsSinceEpoch(millis);
      _startTimer();
    }
  }

  /// 🔹 Foydalanuvchi tanlagan kunlar asosida targetDate yaratiladi
  Future<void> _setDays(int days) async {
    final now = DateTime.now();
    final endOfToday = DateTime(now.year, now.month, now.day, 23, 59, 59);

    _targetDate = endOfToday.add(Duration(days: days));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      _storageKey,
      _targetDate!.millisecondsSinceEpoch,
    );

    _startTimer();
  }

  /// 🔹 Real vaqt timer
  void _startTimer() {
    _timer?.cancel();
    _updateRemaining();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemaining();
    });
  }

  void _updateRemaining() {
    if (_targetDate == null) return;

    final diff = _targetDate!.difference(DateTime.now());

    setState(() {
      _remaining = diff.isNegative ? Duration.zero : diff;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _two(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final days = _remaining.inDays;
    final hours = _remaining.inHours % 24;
    final minutes = _remaining.inMinutes % 60;
    final seconds = _remaining.inSeconds % 60;

    return InkWell(
      onDoubleTap: () async {
  final result = await showDialog<int>(
    context: context,
    builder: (context) {
      final TextEditingController dayController =
          TextEditingController();
      final TextEditingController passwordController =
          TextEditingController();
      String? errorText;

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Kunlar soni va parolni kiriting'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: dayController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Kunlar soni',
                    hintText: 'Masalan: 100',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Parol',
                    errorText: errorText,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Orqaga'),
              ),
              TextButton(
                onPressed: () {
                  final days = int.tryParse(dayController.text);
                  final password = passwordController.text;

                  if (password != 'dolzarb100') {
                    setState(() {
                      errorText = 'Parol noto‘g‘ri';
                    });
                    return;
                  }

                  if (days == null || days <= 0) {
                    setState(() {
                      errorText = 'Kunlar soni noto‘g‘ri';
                    });
                    return;
                  }

                  Navigator.pop(context, days);
                },
                child: const Text('Saqlash'),
              ),
            ],
          );
        },
      );
    },
  );

  if (result != null) {
    await _setDays(result);
  }
},
child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$days',
            style: TextStyle(
              fontSize: 162.h,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          Text(
            ' KUN QOLDI',
            style: TextStyle(
              fontSize: 28.h,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              height: 0.9,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${_two(hours)}:${_two(minutes)}:${_two(seconds)}',
            style: TextStyle(
              fontSize: 18.h,
              color: Colors.white54,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
