import 'package:dolzarb_100_kun/src/data/items.dart';
import 'package:dolzarb_100_kun/src/feature/home/widgets/calendar_count_down.dart';
import 'package:dolzarb_100_kun/src/feature/home/widgets/center_thick_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:open_filex/open_filex.dart';

String getWindowsPdfPath(String pdfName) {
  final exeDir = File(Platform.resolvedExecutable).parent;
  final dataDir = p.join(exeDir.path, 'data', 'files');
  return p.join(dataDir, '$pdfName.pdf');
}


Future<void> openPdfById(BuildContext context, String id) async {
  final pdfPath = getWindowsPdfPath(id);
  final file = File(pdfPath);

  if (!file.existsSync()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Ma'lumot yo'q",textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
    return;
  }

  await OpenFilex.open(pdfPath);
}



class WindowsView extends StatelessWidget {
  const WindowsView({super.key});

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
            padding: const EdgeInsets.only(top: 28, left: 16.0, right: 16.0),
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
                                    TextSpan(text: 'DOLZARB'),
                                    TextSpan(
                                      text: ' 100 ',
                                      style: TextStyle(
                                        color: Color(0xFFEE7427),
                                        fontSize: 98.sp,
                                      ),
                                    ),
                                    TextSpan(text: 'KUNLIK'),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                """("O'ZBEKNEFTGAZ" AJning 22.12.2025 yildagi 01-10-1/42-sonli Bayoni)""",
                                style: TextStyle(color: Color(0xFF00A2DE)),
                              ),
                              CenterThickDivider(
                                height: 3.h,
                                color: Colors.white,
                              ),
                              Text(
                                'Strategik islohotlar va samaradorlik davri',
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
                                'Dolzarb 100 kunlikning ustuvor yo‘nalishlari',
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
                        onTap: () async{
                          await openPdfById(context,it.id);
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
