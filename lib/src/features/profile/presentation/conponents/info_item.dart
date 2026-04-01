import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/shared_widgets/snake_bar.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/features/profile/presentation/bloc/bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProfileInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool selectable;
  const ProfileInfoItem(
      {super.key,
      required this.title,
      required this.value,
      this.selectable = false});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProfileBloc>().state;
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        state is ProfileLoadingState
            ? Shimmer.fromColors(
                baseColor: Colors.blueGrey.shade500,
                highlightColor: Theme.of(context).colorScheme.secondary,
                child: Text(title),
              )
            : Text(title),
        selectable
            ? Row(
                children: [
                  Text(
                    'اضغط لنسخ الكود',
                    style: theme.textTheme.labelSmall,
                  ),
                  5.pw,
                  SelectableText(
                    value,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: theme.primaryColor),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: value));
                      showBar('تم نسخ الكود', context);
                    },
                  ),
                ],
              )
            : Text(value),
      ],
    );
  }
}
