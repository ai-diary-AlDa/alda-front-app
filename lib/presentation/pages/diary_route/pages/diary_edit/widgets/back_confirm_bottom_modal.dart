import 'dart:async';
import 'package:alda_front/presentation/common/widgets/button.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';

class BackConfirmBottomModal extends StatelessWidget {
  const BackConfirmBottomModal(
      {super.key,
      required this.onDeletePressed,
      required this.onTempSavePressed,
      required this.onCancelPressed});

  final VoidCallback onDeletePressed;
  final VoidCallback onTempSavePressed;
  final VoidCallback onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    Container(
                      color: AppColors.black02,
                      height: 50,
                      child: Center(
                        child: Text(
                          "지금 돌아가면 수정한 내용이 사라져요.",
                          style: Theme.of(context).appTexts.body.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(
                      height: 0.1,
                      thickness: 0.1,
                      color: AppColors.lightGray,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      color: AppColors.white,
                      child: Button.filled(
                        pressedOpacity: 0.9,
                        onPressed: () {
                          Navigator.pop(context);
                          scheduleMicrotask(() async {
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            onDeletePressed();
                          });
                        },
                        child: Text(
                          "삭제",
                          style: Theme.of(context).appTexts.body.copyWith(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Divider(
                      height: 0.1,
                      thickness: 0.1,
                      color: AppColors.lightGray,
                    ),
                    Container(
                      color: AppColors.white,
                      width: double.infinity,
                      height: 50,
                      child: Button.filled(
                        pressedOpacity: 0.9,
                        onPressed: () {
                          onTempSavePressed();
                        },
                        child: Text(
                          "임시 저장",
                          style: Theme.of(context).appTexts.body.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16)),
                width: double.infinity,
                height: 50,
                child: Button.filled(
                  pressedOpacity: 0.9,
                  borderRadius: BorderRadius.circular(16),
                  onPressed: () {
                    onCancelPressed();
                  },
                  child: Text(
                    "취소",
                    style: Theme.of(context).appTexts.body.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
