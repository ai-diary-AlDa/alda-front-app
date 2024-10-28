import 'package:alda_front/presentation/common/widgets/animated_gradient_border.dart';
import 'package:alda_front/presentation/pages/main_route/pages/calendar/bloc/calendar_bloc.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:alda_front/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DayDetailsBottomSheet extends StatefulWidget {
  const DayDetailsBottomSheet({
    super.key,
  });

  @override
  State<DayDetailsBottomSheet> createState() => _DayDetailsBottomSheetState();
}

class _DayDetailsBottomSheetState extends State<DayDetailsBottomSheet> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();
  bool _isFullyExpanded = false;

  @override
  void initState() {
    super.initState();
    _sheetController.addListener(_onSheetPositionChanged);
  }

  @override
  void dispose() {
    _sheetController.removeListener(_onSheetPositionChanged);
    _sheetController.dispose();
    super.dispose();
  }

  void _onSheetPositionChanged() {
    setState(() {
      _isFullyExpanded = _sheetController.size >= 0.89;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      initialChildSize: 0.45,
      minChildSize: 0.45,
      maxChildSize: 0.9,
      controller: _sheetController,
      builder: (context, controller) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.black02,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            controller: controller,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 30,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<CalendarBloc, CalendarState>(
                            buildWhen: (previous, current) =>
                                previous.selectedDate != current.selectedDate,
                            builder: (context, state) => Text(
                                DateFormat("M월 dd일").format(state.selectedDate),
                                style: Theme.of(context)
                                    .appTexts
                                    .heading
                                    .copyWith(color: AppColors.white)),
                          ),
                          AnimatedGradientBorder()
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "이날의 기분",
                            style: Theme.of(context).appTexts.label.copyWith(
                                color: AppColors.lightGray, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.white, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9999))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 14),
                                    child: Text("기쁨",
                                        style: Theme.of(context)
                                            .appTexts
                                            .body
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.white)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "이날의 일기",
                            style: Theme.of(context).appTexts.label.copyWith(
                                color: AppColors.lightGray, fontSize: 16),
                          ),
                          SizedBox(
                            height: 300,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: ListView.separated(
                                    physics: _isFullyExpanded
                                        ? AlwaysScrollableScrollPhysics()
                                        : NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                24, 16, 12, 16),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "완전 긴 일기 제목완전 긴 일기 제목완전 긴 일기 제목완전 긴 일기 제목완전 긴 일기 제목완전 긴 일기 제목",
                                                      style: Theme.of(context)
                                                          .appTexts
                                                          .title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      "완전 긴 일기 내용완전 긴 일기 내용완전 긴 일기 내용완전 긴 일기 내용완전 긴 일기 내용완전 긴 일기 내용",
                                                      style: Theme.of(context)
                                                          .appTexts
                                                          .body,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                )),
                                                SizedBox(width: 24),
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.black01,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Center(
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_outlined,
                                                          color:
                                                              AppColors.white,
                                                          size: 30,
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 12,
                                        ),
                                    itemCount: 10)),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
