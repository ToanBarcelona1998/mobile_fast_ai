import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

typedef OnConfirmPicker = void Function(DateTime);
typedef OnDateChange = void Function(DateTime);

class CupertinoDatePickerHelper {
  final TextStyle ?cancelStyle;
  final TextStyle ?doneStyle;
  final TextStyle ?itemStyle;
  final Color backgroundColor;
  final Color? headerColor;

  final double containerHeight;
  final double titleHeight;
  final double itemHeight;
  final AppTheme appTheme;

  const CupertinoDatePickerHelper({
    this.cancelStyle,
    this.doneStyle,
    this.itemStyle,
    this.backgroundColor = Colors.white,
    this.headerColor,
    this.containerHeight = BoxSize.boxSize15,
    this.titleHeight = BoxSize.boxSize09,
    this.itemHeight = BoxSize.boxSize08,
    required this.appTheme
  });

  Future<DateTime?> showDatePicker(
      BuildContext context, {
        VoidCallback? onCancel,
        OnConfirmPicker ?onConfirm,
        OnDateChange? onDateChange,
        DateTime? current,
      }) async {
    return DatePicker.showDatePicker(
      context,
      onCancel: onCancel,
      onConfirm: onConfirm,
      onChanged: onDateChange,
      locale: LocaleType.vi,
      theme: DatePickerTheme(
        cancelStyle: cancelStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.greyScaleColor700,
        ),
        backgroundColor: backgroundColor,
        containerHeight: containerHeight,
        doneStyle: doneStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.primaryColor900,
        ),
        headerColor: headerColor,
        itemHeight: itemHeight,
        itemStyle: itemStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.greyScaleColor700,
        ),
        titleHeight: titleHeight,
      ),
      currentTime: current ?? DateTime.now(),
      minTime: DateTime(
        DateTime.now().year - 70,
        12,
        31,
      ),
      maxTime: DateTime(
        DateTime.now().year + 10,
        12,
        31,
      ),
    );
  }

  Future<DateTime?> showTimePicker(
      BuildContext context, {
        VoidCallback? onCancel,
        OnConfirmPicker ?onConfirm,
        OnDateChange? onDateChange,
        DateTime? current,
      }) async {
    return DatePicker.showTimePicker(
      context,
      onCancel: onCancel,
      onConfirm: onConfirm,
      onChanged: onDateChange,
      locale: LocaleType.vi,
      theme: DatePickerTheme(
        cancelStyle: cancelStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.greyScaleColor700,
        ),
        backgroundColor: backgroundColor,
        containerHeight: containerHeight,
        doneStyle: doneStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.primaryColor900,
        ),
        headerColor: headerColor,
        itemHeight: itemHeight,
        itemStyle: itemStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.greyScaleColor700,
        ),
        titleHeight: titleHeight,
      ),
      currentTime: current ?? DateTime.now(),
    );
  }

  Future<DateTime?> showDateTimePicker(
      BuildContext context, {
        VoidCallback? onCancel,
        OnConfirmPicker ?onConfirm,
        OnDateChange? onDateChange,
        DateTime? current,
      }) async {
    return await DatePicker.showDateTimePicker(
      context,
      onCancel: onCancel,
      onConfirm: onConfirm,
      onChanged: onDateChange,
      locale: LocaleType.vi,
      theme: DatePickerTheme(
        cancelStyle: cancelStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.greyScaleColor700,
        ),
        backgroundColor: backgroundColor,
        containerHeight: containerHeight,
        doneStyle: doneStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.primaryColor900,
        ),
        headerColor: headerColor,
        itemHeight: itemHeight,
        itemStyle: itemStyle ?? AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.greyScaleColor700,
        ),
        titleHeight: titleHeight,
      ),
      currentTime: current ?? DateTime.now(),
      minTime: DateTime.now(),
      maxTime: DateTime(
        DateTime.now().year + 10,
        12,
        31,
      ),
    );
  }
}
