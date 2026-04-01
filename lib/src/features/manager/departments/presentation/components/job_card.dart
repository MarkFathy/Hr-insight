import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';

class JobCard extends StatefulWidget {
  final JobDataEntity job;
  final int deptId;
  const JobCard({super.key, required this.job, required this.deptId});

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool jobModifing = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DepartmentsAndJobsBloc>();

    return Column(
      children: [
        const Divider(
          thickness: 3,
        ),
        StatefulBuilder(builder: (context, changeState) {
          return ListTile(
            leading: InkWell(
                onTap: () {
                  if (jobModifing &&
                      bloc.jobEditNameCtrl.text != widget.job.title) {
                    if (!bloc.jobEditfFormKey.currentState!.validate()) return;
                    bloc.add(EditJobEvent(
                        jobId: widget.job.id!, departmentId: widget.deptId));
                    changeState(() => jobModifing = !jobModifing);
                  } else {
                    bloc.jobEditNameCtrl.text = widget.job.title!;
                    changeState(() => jobModifing = !jobModifing);
                  }
                },
                child: jobModifing
                    ? bloc.jobEditNameCtrl.text != widget.job.title
                        ? const Icon(Icons.done_all)
                        : const Icon(Icons.close)
                    : const Icon(Icons.edit)),
            title: jobModifing
                ? Form(
                    key: bloc.jobEditfFormKey,
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: ('المسمى الوظيفى'),
                            contentPadding: EdgeInsets.zero),
                        onChanged: (value) {
                          changeState(() {});
                        },
                        controller: bloc.jobEditNameCtrl),
                  )
                : Text(widget.job.title!),
            subtitle: Text('عدد الموظفين : ${widget.job.employeesCount}'),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog.adaptive(
                        content: const Text("سيتم حذف الوظيفة نهائياً"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                bloc.add(DeleteJobEvent(widget.job.id!));
                                NV.pop(context);
                              },
                              child: const Text('موافق')),
                          TextButton(
                              onPressed: () {
                                NV.pop(context);
                              },
                              child: const Text('إلغاء')),
                        ],
                      );
                    });
              },
            ),
          );
        }),
      ],
    );
  }
}
