import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'package:timer_tutorial_app/modules/timer/timer_controller.dart';

class TimerPage extends StatelessWidget {
  TimerPage({super.key});

  final TimerController controller = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Timer App'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.moon),
            onPressed: () {
              controller.changeTheme();
            },
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => CircularStepProgressIndicator(
                  totalSteps: controller.totalSeconds2.value == 0
                      ? 1
                      : controller.totalSeconds2.value,
                  currentStep: controller.totalSeconds.value,
                  stepSize: 10,
                  selectedColor: Colors.greenAccent,
                  unselectedColor: Colors.grey[200],
                  padding: 0,
                  width: 200,
                  height: 200,
                  selectedStepSize: 15,
                  roundedCap: (_, __) => true,
                  child: Center(
                    child: Text(
                      controller.time.value,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  controller.stopTimer();
                },
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.stop_fill,
                      size: 40,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.dialog(
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: size.width * 0.9,
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NumberPicker(
                                selectedTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                value: controller.remainingHours.value,
                                minValue: 0,
                                maxValue: 24,
                                onChanged: (value) {
                                  controller.remainingHours.value = value;
                                }),
                            Text(
                              ':',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            NumberPicker(
                                selectedTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                value: controller.remainingMinutes.value,
                                minValue: 0,
                                maxValue: 59,
                                onChanged: (value) {
                                  controller.remainingMinutes.value = value;
                                }),
                            Text(
                              ':',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            NumberPicker(
                                selectedTextStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall,
                                value: controller.remainingSeconds.value,
                                minValue: 0,
                                maxValue: 59,
                                onChanged: (value) {
                                  controller.remainingSeconds.value = value;
                                }),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.sumSeconds();
                                controller.startTimer();
                                Get.back();
                              },
                              child: const Text(
                                'شروع',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                                controller.remainingSeconds.value = 0;
                                controller.remainingMinutes.value = 0;
                                controller.remainingHours.value = 0;
                              },
                              child: const Text('لغو'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          backgroundColor: Colors.greenAccent,
          child: const Icon(CupertinoIcons.pencil),
        ),
      ),
    );
  }
}
