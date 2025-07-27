import 'package:flutter/material.dart';
import 'package:lucielle/lucielle.dart';

abstract class LuciDialogs {
  static Future<T?> showDialog<T>({
    required BuildContext context,
    required String title,
    required String content,
    required String positiveButtonLabel,
    required String negativeButtonLabel,
    required VoidCallback positiveButtonCallback,
    Color? dialogBackgroundColor,
    Color? primaryColor,
    bool? barrierDismissible,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    return showAdaptiveDialog<T?>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: dialogBackgroundColor,
          icon: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: dialogBackgroundColor ?? Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor ?? Colors.blue,
                width: 4,
              ),
            ),
            child: Icon(
              Icons.question_mark_rounded,
              color: primaryColor,
              size: 40,
            ),
          ),
          title: LuciText.titleMedium(
            title,
            fontWeight: FontWeight.bold,
          ),
          content: LuciText.bodyMedium(content),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            Center(
              child: SizedBox(
                width: context.width * 0.8,
                child: Row(
                  children: [
                    Expanded(
                      child: LuciOutlinedButton(
                        borderColor: primaryColor ?? Colors.blue,
                        borderSide:
                            BorderSide(color: primaryColor ?? Colors.black),
                        onPressed: () => Navigator.of(context).pop(true),
                        child: LuciText.bodyMedium(
                          negativeButtonLabel,
                          fontWeight: FontWeight.bold,
                          textColor: primaryColor ?? Colors.blue,
                        ),
                      ),
                    ),
                    horizontalBox8,
                    Expanded(
                      child: LuciOutlinedButton(
                        backgroundColor: primaryColor ?? Colors.blue,
                        borderColor: primaryColor ?? Colors.blue,
                        onPressed: () {
                          positiveButtonCallback();
                          Navigator.of(context).pop(false);
                        },
                        child: LuciText.bodyMedium(
                          positiveButtonLabel,
                          fontWeight: FontWeight.bold,
                          textColor: dialogBackgroundColor ?? Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
