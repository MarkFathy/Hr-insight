import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/core/di/service_locator.dart';
import 'package:hr_app/core/network/dio_error_handler.dart';
import 'package:hr_app/core/service/internet_connection_service.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/core/widgets/app_button.dart';

class AppErrorState extends StatelessWidget {
  final String message;
  final String? title;
  final VoidCallback? onRetry;
  final String? retryLabel;
  final bool? isNetworkError;

  const AppErrorState({
    required this.message,
    super.key,
    this.title,
    this.onRetry,
    this.retryLabel,
    this.isNetworkError,
  });

  bool _resolveIsOffline() {
    if (isNetworkError != null) return isNetworkError!;
    if (DioErrorHandler.isNetworkError(message)) return true;
    if (sl.isRegistered<IInternetConnectionService>()) {
      return sl<IInternetConnectionService>().currentState ==
          NetworkState.disconnected;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isOffline = _resolveIsOffline();
    final isTimeout =
        message == DioErrorHandler.timeoutMessage ||
        message.toLowerCase().contains('timed out') ||
        message.contains('مهلة الاتصال');

    final accentColor = isOffline
        ? context.colors.warning
        : context.colors.error;

    final resolvedTitle =
        title ??
        (isTimeout
            ? 'ضعف في الاتصال بالإنترنت'
            : isOffline
            ? (context.l10n?.no_internet_title ?? 'لا يوجد اتصال بالإنترنت')
            : 'تعذر تحميل البيانات');

    final resolvedSubtitle = isTimeout
        ? 'استغرق الاتصال بالخادم وقتاً أطول من المعتاد، يرجى التحقق من جودة الإنترنت والمحاولة مرة أخرى.'
        : isOffline
        ? 'تأكد من اتصالك بشبكة الـ Wi-Fi أو بيانات الهاتف، ثم اضغط على إعادة المحاولة لتحديث الصفحة.'
        : message;

    final mainIcon = isOffline
        ? Icons.wifi_off_rounded
        : Icons.error_outline_rounded;

    final currentRetry = onRetry;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Container(
          constraints: BoxConstraints(maxWidth: 340.w),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: accentColor.withValues(alpha: 0.22),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Layered Icon Illustration
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 96.r,
                    height: 96.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accentColor.withValues(alpha: 0.08),
                    ),
                  ),
                  Container(
                    width: 72.r,
                    height: 72.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accentColor.withValues(alpha: 0.16),
                      border: Border.all(
                        color: accentColor.withValues(alpha: 0.35),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(mainIcon, size: 34.r, color: accentColor),
                  ),
                  if (isOffline)
                    Positioned(
                      bottom: 4.r,
                      right: 4.r,
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          color: context.colors.surface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: accentColor.withValues(alpha: 0.4),
                          ),
                        ),
                        child: Icon(
                          Icons.cloud_off_rounded,
                          size: 14.r,
                          color: accentColor,
                        ),
                      ),
                    ),
                ],
              ),
              18.ph,
              if (isOffline) ...[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    isTimeout ? 'انتهت مهلة الاتصال' : 'غير متصل بالشبكة',
                    style: context.typography.labelSmall.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
                10.ph,
              ],
              Text(
                resolvedTitle,
                textAlign: TextAlign.center,
                style: context.typography.titleLarge.copyWith(
                  color: context.colors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
              ),
              8.ph,
              Text(
                resolvedSubtitle,
                textAlign: TextAlign.center,
                style: context.typography.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                  height: 1.5,
                  fontSize: 13.sp,
                ),
              ),
              if (currentRetry != null) ...[
                22.ph,
                AppButton(
                  title: retryLabel ?? 'إعادة المحاولة',
                  icon: Icons.refresh_rounded,
                  margin: EdgeInsets.zero,
                  onTap: currentRetry,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
