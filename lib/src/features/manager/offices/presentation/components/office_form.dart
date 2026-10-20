import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/di/service_locator.dart';
import 'package:hr_app/src/core/utils/extensions.dart';
import 'package:hr_app/src/core/utils/navigation_helper.dart';
import 'package:hr_app/src/core/widgets/app_back_button.dart';
import 'package:hr_app/src/core/widgets/app_button.dart';
import 'package:hr_app/src/core/widgets/app_snack_bar.dart';
import 'package:hr_app/src/core/widgets/app_text_field.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/offices/presentation/components/map_picker.dart';
import 'package:latlong2/latlong.dart';

class OfficeForm extends StatefulWidget {
  final VoidCallback rebuild;
  final OfficeDataEntity? data;

  const OfficeForm({required this.rebuild, super.key, this.data});

  @override
  State<OfficeForm> createState() => _OfficeFormState();
}

class _OfficeFormState extends State<OfficeForm> {
  late final OfficesBloc _bloc;
  final _formKey = GlobalKey<FormState>();
  LatLng? _selectedLoc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<OfficesBloc>();
    if (widget.data != null) {
      _bloc.nameCtrl.text = widget.data!.name ?? '';
      _bloc.radiusCtrl.text = widget.data!.radius.formatRadius;
      if (widget.data!.lat != null && widget.data!.lng != null) {
        final loc = LatLng(widget.data!.lat!, widget.data!.lng!);
        _bloc.location = loc;
        _selectedLoc = loc;
      }
    } else {
      _bloc.nameCtrl.clear();
      _bloc.radiusCtrl.clear();
      _bloc.location = null;
      _selectedLoc = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.data != null;

    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<OfficesBloc, OfficesState>(
        listener: (context, state) {
          if (state is OfficesModifiedState) {
            widget.rebuild();
            NavigationHelper.pop(context, true);
            AppSnackBar.showSuccess(
              context,
              isEdit
                  ? 'تم تعديل بيانات المكتب بنجاح'
                  : 'تمت إضافة المكتب بنجاح',
            );
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: context.colors.background,
          appBar: AppBar(
            leading: const AppBackButton(),
            title: Text(
              isEdit ? 'تعديل بيانات المكتب' : 'إضافة فرع / مكتب جديد',
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 16.r),
              child: AppButton(
                title: isEdit ? 'حفظ التعديلات' : 'إضافة المكتب',
                isLoading: state is OfficesLoadingState,
                icon: isEdit
                    ? Icons.check_circle_outline_rounded
                    : Icons.add_circle_outline_rounded,
                onTap: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (_bloc.location == null) {
                    AppSnackBar.showError(
                      context,
                      'يرجى تحديد موقع المكتب على الخريطة أولاً',
                    );
                    return;
                  }
                  _bloc.add(
                    isEdit
                        ? EditOfficeEvent(id: widget.data!.id!)
                        : const AddOfficeEvent(),
                  );
                },
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Full-Width Map Section
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: context.colors.primary.withValues(alpha: 0.2),
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.r,
                            vertical: 10.r,
                          ),
                          color: context.colors.surfaceContainerHigh,
                          child: Row(
                            children: [
                              Icon(
                                Icons.touch_app_rounded,
                                color: context.colors.primary,
                                size: 18.r,
                              ),
                              8.pw,
                              Expanded(
                                child: Text(
                                  'اضغط على الخريطة لتحديد موقع المكتب',
                                  style: context.typography.bodySmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              if (_selectedLoc != null)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.r,
                                    vertical: 3.r,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.colors.success
                                        .withValues(alpha: 0.15),
                                    borderRadius: context.radius.xsBorder,
                                    border: Border.all(
                                      color: context.colors.success
                                          .withValues(alpha: 0.4),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        color: context.colors.success,
                                        size: 13.r,
                                      ),
                                      4.pw,
                                      Text(
                                        'تم التحديد',
                                        style: context.typography.bodySmall
                                            .copyWith(
                                          color: context.colors.success,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        MapPicker(
                          height: 320.h,
                          oldLoc: (widget.data != null &&
                                  widget.data!.lat != null &&
                                  widget.data!.lng != null)
                              ? LatLng(widget.data!.lat!, widget.data!.lng!)
                              : null,
                          onLocationChanged: (loc) {
                            setState(() => _selectedLoc = loc);
                          },
                        ),
                      ],
                    ),
                  ),

                  // Form Fields
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 24.r),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Error banner
                          if (state is OfficesErrorState) ...[
                            Container(
                              padding: EdgeInsets.all(12.r),
                              margin: EdgeInsets.only(bottom: 14.r),
                              decoration: BoxDecoration(
                                color: context.colors.error.withValues(alpha: 0.12),
                                borderRadius: context.radius.smBorder,
                                border: Border.all(
                                  color: context.colors.error.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline_rounded,
                                    color: context.colors.error,
                                    size: 18.r,
                                  ),
                                  8.pw,
                                  Expanded(
                                    child: Text(
                                      state.message,
                                      style: context.typography.bodySmall.copyWith(
                                        color: context.colors.error,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          // Input Fields
                          AppTextField(
                            label: 'اسم المكتب أو الفرع',
                            hintText: 'مثال: الفرع الرئيسي - القاهرة',
                            controller: _bloc.nameCtrl,
                            prefixIcon: const Icon(Icons.location_city_rounded),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'يرجى إدخال اسم المكتب';
                              }
                              return null;
                            },
                          ),
                          14.ph,
                          AppTextField(
                            label: 'نطاق التوقيع الجغرافي (بالمتر)',
                            hintText: 'مثال: 100',
                            controller: _bloc.radiusCtrl,
                            prefixIcon: const Icon(Icons.radar_rounded),
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'يرجى إدخال نطاق التوقيع';
                              }
                              final val = double.tryParse(value.trim());
                              if (val == null || val <= 0) {
                                return 'أدخل رقماً صحيحاً أكبر من 0';
                              }
                              return null;
                            },
                          ),
                          8.ph,
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.r,
                              vertical: 4.r,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  size: 15.r,
                                  color: context.colors.textSecondary,
                                ),
                                6.pw,
                                Expanded(
                                  child: Text(
                                    'يحدد نطاق التوقيع بالمتر المسافة المسموح بها للموظف لتسجيل الحضور والانصراف جغرافياً حول موقع المكتب.',
                                    style: context.typography.bodySmall.copyWith(
                                      color: context.colors.textSecondary,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Compatibility alias
typedef OfficeFormScreen = OfficeForm;
