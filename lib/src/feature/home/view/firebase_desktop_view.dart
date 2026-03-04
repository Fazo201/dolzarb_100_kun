import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dolzarb_100_kun/src/data/items.dart';
import 'package:dolzarb_100_kun/src/feature/home/widgets/calendar_count_down.dart';
import 'package:dolzarb_100_kun/src/feature/home/widgets/center_thick_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FirebaseDesktopView extends StatelessWidget {
  const FirebaseDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/backround.png',
              width: mq.width,
              height: mq.height,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, left: 16.0, right: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: mq.height * 0.5,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: mq.width * 0.70,
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/uzneftgaz.svg',
                                    width: 32.w,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'UZBEKNEFTEGAZ',
                                    style: TextStyle(
                                      color: Color(0xFFEE7427),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text.rich(
                                style: TextStyle(
                                  fontSize: 68.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00A2DE),
                                ),
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'ДОЛЗАРБ'),
                                    TextSpan(
                                      text: ' 100 ',
                                      style: TextStyle(
                                        color: Color(0xFFEE7427),
                                        fontSize: 98.sp,
                                      ),
                                    ),
                                    TextSpan(text: 'КУНЛИК'),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '(“ЎЗБЕКНЕФТГАЗ” АЖнинг 22.12.2025 йилдаги 01-10-1/42-сонли Баёни)',
                                style: TextStyle(color: Color(0xFF00A2DE)),
                              ),
                              CenterThickDivider(
                                height: 3.h,
                                color: Colors.white,
                              ),
                              Text(
                                'Стратегик ислоҳотлар ва самарадорлик даври',
                                style: TextStyle(
                                  color: Color(0xFF2B807B),
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              CenterThickDivider(
                                height: 2.h,
                                color: Colors.white,
                              ),
                              Spacer(),
                              Text(
                                'Долзарб 100 кунликнинг устувор йўналишлари',
                                style: TextStyle(
                                  color: Color(0xFF013A92),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              CenterThickDivider(
                                height: 2.h,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          right: 0,
                          child: Container(
                            height: mq.height * 0.5,
                            child: Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/big.png',
                                    fit: BoxFit.fill,
                                  ),
                                  Center(child: CalendarCountdown()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1.6,
                        ),
                    itemBuilder: (context, i) {
                      final it = dataItems[i];

                      return GestureDetector(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: '',
                            transitionDuration: const Duration(
                              milliseconds: 250,
                            ),
                            pageBuilder: (_, __, ___) {
                              return _FullScreenDialog(item: it);
                            },
                            transitionBuilder: (_, anim, __, child) {
                              return FadeTransition(
                                opacity: anim,
                                child: child,
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              Image.asset(it.imageUrl, height: 112.h),
                              const SizedBox(height: 4),
                              Text(
                                it.label,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xFF013A92),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FullScreenDialog extends StatefulWidget {
  final DataItems item;
  const _FullScreenDialog({required this.item});

  @override
  State<_FullScreenDialog> createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<_FullScreenDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _editing = true;
                });
              },
              child: const Icon(Icons.edit),
            ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Image.asset(widget.item.imageUrl, height: 60),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.item.label,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003177),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            const Divider(),

            // REAL-TIME DESCRIPTION
            Expanded(
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('items')
                    .doc(widget.item.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.data?.data();
                  final description = data?['description'] ?? '';

                  if (_editing) {
                    _controller.text = description;
                  }

                  return Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 46.0,
                        vertical: 12,
                      ),
                      child: _editing
                          ? Column(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _controller,
                                    maxLines: null,
                                    expands: true,
                                    textAlignVertical: TextAlignVertical.top, 
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Маълумотни киритинг',
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.all(
                                        12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() => _editing = false);
                                      },
                                      child: const Text('Бекор қилиш'),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton.icon(
                                      icon: const Icon(Icons.save),
                                      label: const Text('Сақлаш'),
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('items')
                                            .doc(widget.item.id)
                                            .set({
                                              'description': _controller.text
                                                  .trim(),
                                              'updatedAt':
                                                  FieldValue.serverTimestamp(),
                                            }, SetOptions(merge: true));
                                        setState(() => _editing = false);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Saqlandi'),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : SingleChildScrollView(
                              child: Text(
                                description.isEmpty
                                    ? "Ma'lumot mavjud emas"
                                    : description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  color: Color(0xFF06005A),
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}