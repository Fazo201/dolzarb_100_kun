import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFe6f2fb), Color(0xFFdff1fb)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo + title
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.water_drop, color: Color(0xFF1DA1F2), size: 36),
                                SizedBox(width: 8),
                                Text('UZBEKNEFTEGAZ', style: TextStyle(color: Color(0xFF0B5A8A), fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 18),
                            Text('ДОЛЗАРБ 100 КУНЛИК', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Color(0xFF0B6DA8))),
                            SizedBox(height: 6),
                            Text('(Стратегик ислоҳотлар ва самарадорлик даври)', style: TextStyle(color: Color(0xFF5B9DBF))),
                            SizedBox(height: 14),
                            Divider(color: Color(0xFFBDE0F6), thickness: 1),
                            SizedBox(height: 8),
                            Text('Стратегик ислоҳотлар ва самарадорлик даври', style: TextStyle(color: Color(0xFF3A7FA3))),
                          ],
                        ),
                      ),

                      // Circular gauge
                      SizedBox(
                        width: mq.width * 0.32,
                        height: mq.width * 0.32,
                        child: Center(
                          child: CircularGauge(value: 0.99, label: '99', sublabel: 'КУН ҚОЛДИ'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Section title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Долзарб 100 кунликнинг устувор йўналишлари', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF0B4F72))),
              ),
            ),

            const SizedBox(height: 14),

            // Icon grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: List.generate(_items.length, (i) {
                  final it = _items[i];
                  return SizedBox(
                    width: (mq.width - 64) / 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(it.icon, color: it.color, size: 28),
                        ),
                        const SizedBox(height: 8),
                        Text(it.label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Color(0xFF145A78))),
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class CircularGauge extends StatelessWidget {
  final double value; // 0..1
  final String label;
  final String sublabel;

  const CircularGauge({super.key, required this.value, required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _GaugePainter(value),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(sublabel, style: const TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
      ],
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double value;
  _GaugePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.45;

    final basePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.18
      ..color = Colors.blue.shade700.withOpacity(0.2)
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.18
      ..shader = const LinearGradient(colors: [Color(0xFF2DA6F6), Color(0xFF1FB57A)]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, basePaint);

    final start = -3.14 / 2;
    final sweep = 2 * 3.1415926535 * (value.clamp(0.0, 1.0));
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), start, sweep, false, progressPaint);

    // inner circle
    final inner = Paint()..color = Colors.blue.shade800;
    canvas.drawCircle(center, radius * 0.68, inner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Item {
  final IconData icon;
  final String label;
  final Color color;
  const _Item(this.icon, this.label, this.color);
}

const List<_Item> _items = [
  _Item(Icons.account_tree, 'Стратегик фаолият билан операцион бошқарувни бир-биридан ажратиш', Color(0xFF2B9BD3)),
  _Item(Icons.business, 'Стратегия офисини ташкил этиш', Color(0xFF1EA2D6)),
  _Item(Icons.landscape, 'Геологик-қидирув ишлари харажатларини мақбуллаштириш', Color(0xFF3AA76D)),
  _Item(Icons.build, 'Газни чуқур қайта ишлаш', Color(0xFF3B82C4)),
  _Item(Icons.monetization_on, 'Кредит юкламасини кескин камайтириш', Color(0xFF2E9E7E)),
  _Item(Icons.pie_chart, 'Молиявий шаффофликни тўлиқ таъминлаш', Color(0xFF6FB3D4)),
  _Item(Icons.group, 'Кадрлар сиёсати ва самарадорликнинг муҳим кўрсаткичлари', Color(0xFF5AA2C9)),
  _Item(Icons.show_chart, 'Инвестиция сиёсатида самарадорликнинг устуворлиги', Color(0xFF4DBA8E)),
  _Item(Icons.smart_toy, 'Рақамлаштириш ва сунъий интеллектдан фойдаланиш', Color(0xFF7C9FE5)),
  _Item(Icons.oil_barrel, 'Қазиб чиқаришда янги ёндашув', Color(0xFF2F7FA1)),
];

