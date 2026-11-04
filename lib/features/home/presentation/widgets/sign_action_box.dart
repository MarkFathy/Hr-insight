import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/shared/widgets/animated_switch.dart';
import 'package:shimmer/shimmer.dart';

/// The interactive fingerprint sign action button on the home dashboard.
class SignActionBox extends StatelessWidget {
  final bool isAttended;
  final bool isSignedOut;
  final bool isLoading;
  final VoidCallback onTap;

  const SignActionBox({
    required this.isAttended,
    required this.isSignedOut,
    required this.isLoading,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: context.colors.primary,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(18),
        bottomRight: Radius.circular(18),
      ),
      border: Border.all(color: context.colors.primary, width: 2),
    ),
    clipBehavior: Clip.hardEdge,
    child: (isAttended && isSignedOut)
        ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Icon(
              Icons.domain_verification_outlined,
              color: Colors.black,
              size: 52,
            ),
          )
        : InkWell(
            onTap: isLoading ? null : onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: AnimatedSwitch(
                isFadeTransition: true,
                child: isLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.black38,
                        highlightColor: Colors.white,
                        period: const Duration(milliseconds: 400),
                        child: const Icon(
                          Icons.fingerprint,
                          color: Colors.black,
                          size: 52,
                        ),
                      )
                    : const Icon(
                        Icons.fingerprint,
                        color: Colors.black,
                        size: 52,
                      ),
              ),
            ),
          ),
  );
}
