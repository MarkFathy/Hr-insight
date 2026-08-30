import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';

class EmployeePickerSheet extends StatefulWidget {
  final List<EmployeeDataEntity> employees;
  final int? selectedId;
  final bool showAllOption;
  final ValueChanged<EmployeeDataEntity?> onSelected;

  const EmployeePickerSheet({
    super.key,
    required this.employees,
    required this.selectedId,
    required this.onSelected,
    this.showAllOption = true,
  });

  static Future<void> show({
    required BuildContext context,
    required List<EmployeeDataEntity> employees,
    required int? selectedId,
    required ValueChanged<EmployeeDataEntity?> onSelected,
    bool showAllOption = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => EmployeePickerSheet(
        employees: employees,
        selectedId: selectedId,
        onSelected: onSelected,
        showAllOption: showAllOption,
      ),
    );
  }

  @override
  State<EmployeePickerSheet> createState() => _EmployeePickerSheetState();
}

class _EmployeePickerSheetState extends State<EmployeePickerSheet> {
  String _searchQuery = '';
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filteredEmployees = widget.employees.where((e) {
      if (_searchQuery.trim().isEmpty) return true;
      final name = e.name?.toLowerCase() ?? '';
      final job = e.job?.title?.toLowerCase() ?? '';
      final dept = e.department?.name?.toLowerCase() ?? '';
      final query = _searchQuery.toLowerCase().trim();
      return name.contains(query) || job.contains(query) || dept.contains(query);
    }).toList();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 12.r, bottom: 8.r),
              width: 40.r,
              height: 4.r,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.people_alt_rounded,
                        color: theme.primaryColor,
                        size: 20.r,
                      ),
                    ),
                    10.pw,
                    Text(
                      'اختر الموظف',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.r,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 4.r),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${widget.employees.length} موظف',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search Field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            child: TextField(
              controller: _searchCtrl,
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.r,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.colorScheme.secondary.withValues(alpha: 0.6),
                hintText: 'بحث باسم الموظف أو القسم...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 13.r,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.r,
                  vertical: 12.r,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: theme.primaryColor,
                  size: 20.r,
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.white.withValues(alpha: 0.7),
                          size: 18.r,
                        ),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),

          const Divider(height: 1),

          // Employees List
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
              children: [
                // "All Employees" option
                if (widget.showAllOption && _searchQuery.isEmpty)
                  _buildEmployeeTile(
                    context: context,
                    theme: theme,
                    isSelected: widget.selectedId == null,
                    name: 'جميع الموظفين',
                    subtitle: 'عرض كافة طلبات وبيانات الموظفين',
                    icon: Icons.groups_rounded,
                    onTap: () {
                      widget.onSelected(null);
                      Navigator.pop(context);
                    },
                  ),

                ...filteredEmployees.map((emp) {
                  final isSelected = widget.selectedId == emp.id;
                  final deptOrJob = [
                    if (emp.department?.name != null) emp.department!.name!,
                    if (emp.job?.title != null) emp.job!.title!,
                  ].join(' • ');

                  return _buildEmployeeTile(
                    context: context,
                    theme: theme,
                    isSelected: isSelected,
                    name: emp.name ?? 'بدون اسم',
                    subtitle: deptOrJob.isNotEmpty ? deptOrJob : 'موظف',
                    imageUrl: emp.image,
                    onTap: () {
                      widget.onSelected(emp);
                      Navigator.pop(context);
                    },
                  );
                }),

                if (filteredEmployees.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.r),
                    child: Column(
                      children: [
                        Icon(
                          Icons.person_search_rounded,
                          size: 48.r,
                          color: Colors.white.withValues(alpha: 0.3),
                        ),
                        10.ph,
                        Text(
                          'لا يوجد موظف بهذا الاسم',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.6),
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          16.ph,
        ],
      ),
    );
  }

  Widget _buildEmployeeTile({
    required BuildContext context,
    required ThemeData theme,
    required bool isSelected,
    required String name,
    required String subtitle,
    String? imageUrl,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.r),
      child: Material(
        color: isSelected
            ? theme.primaryColor.withValues(alpha: 0.12)
            : theme.colorScheme.secondary.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
          side: BorderSide(
            color: isSelected ? theme.primaryColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 4.r),
          leading: Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor.withValues(alpha: 0.15),
              border: Border.all(
                color: isSelected
                    ? theme.primaryColor
                    : theme.primaryColor.withValues(alpha: 0.4),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: imageUrl.toValidImageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: imageUrl.toValidImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: theme.colorScheme.secondary,
                        child: Center(
                          child: SizedBox(
                            width: 16.r,
                            height: 16.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (_, __, ___) => Icon(
                        Icons.person_rounded,
                        color: theme.primaryColor,
                        size: 24.r,
                      ),
                    )
                  : Icon(
                      icon ?? Icons.person_rounded,
                      color: theme.primaryColor,
                      size: 24.r,
                    ),
            ),
          ),
          title: Text(
            name,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              color: isSelected ? theme.primaryColor : Colors.white,
              fontSize: 14.r,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 11.r,
            ),
          ),
          trailing: Container(
            width: 24.r,
            height: 24.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? theme.primaryColor : Colors.transparent,
              border: Border.all(
                color: isSelected
                    ? theme.primaryColor
                    : Colors.white.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: isSelected
                ? const Icon(
                    Icons.check_rounded,
                    size: 16,
                    color: Colors.black,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
