import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  Timer? _timer;
  RxInt totalSeconds2 = 0.obs;
  RxInt totalSeconds3 = 0.obs;
  RxInt totalSeconds = 0.obs;
  RxInt remainingSeconds = 0.obs;
  RxInt remainingMinutes = 0.obs;
  RxInt remainingHours = 0.obs;
  final RxString time = '00:00:00'.obs;
  RxBool isDark = false.obs;

  resetInputs() {
    totalSeconds2.value = 0;
    totalSeconds3.value = 0;
    totalSeconds.value = 0;
    remainingSeconds.value = 0;
    remainingMinutes.value = 0;
    remainingHours.value = 0;
  }

  changeTheme() {
    if (isDark.value) {
      Get.changeThemeMode(ThemeMode.light);
      isDark.value = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      isDark.value = true;
    }
  }

  stopTimer() {
    time.value = '00:00:00';
    _timer!.cancel();
    resetInputs();
  }

  sumSeconds() {
    
    totalSeconds.value = 0;
    totalSeconds2.value = 0;
    totalSeconds3.value = 0;
    if (remainingHours.value != 0) {
      totalSeconds.value += (remainingHours.value * 60 * 60);
    }
    if (remainingMinutes.value != 0) {
      totalSeconds.value += (remainingMinutes.value * 60);
    }
    totalSeconds.value += remainingSeconds.value;
    totalSeconds2.value = totalSeconds.value;
    totalSeconds3.value = totalSeconds.value;
    remainingSeconds.value = 0;
    remainingMinutes.value = 0;
    remainingHours.value = 0;
  }

  @override
  void onClose() {
    super.onClose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    const duration = Duration(seconds: 1);
    int hours = 0;
    int minutes = 0;
    int seconds = 0;
    if (totalSeconds3.value >= 3600) {
      hours = totalSeconds3.value ~/ 3600;
      totalSeconds3.value -= (hours * 3600);
    } else {
      hours = 0;
    }
    if (totalSeconds3.value >= 60) {
      minutes = totalSeconds3.value ~/ 60;
      totalSeconds3.value -= (minutes * 60);
    } else {
      minutes = 0;
    }
    if (totalSeconds3.value >= 0) {
      seconds = totalSeconds3.value;
    } else {
      seconds = 0;
    }
    totalSeconds3.value = totalSeconds.value;
    log('$hours:$minutes:$seconds');
    _timer = Timer.periodic(duration, (Timer timer) {
      if (totalSeconds.value == 0) {
        timer.cancel();
        time.value = '00:00:00';
      } else {
        totalSeconds--;
          totalSeconds3.value = totalSeconds.value;
         time.value =
            "${hours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        if (totalSeconds3.value >= 3600) {
          hours = totalSeconds3.value ~/ 3600;
          totalSeconds3.value -= (hours * 3600);
        } else {
          hours = 0;
        }
        if (totalSeconds3.value >= 60) {
          minutes = totalSeconds3.value ~/ 60;
          totalSeconds3.value -= (minutes * 60);
        } else {
          minutes = 0;
        }
        if (totalSeconds3.value >= 0) {
          seconds = totalSeconds3.value;
        } else {
          seconds = 0;
        }
      
      }
    });
  }
}
