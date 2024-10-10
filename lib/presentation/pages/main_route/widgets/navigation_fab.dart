import 'package:alda_front/presentation/navigation/navigation.gr.dart';
import 'package:alda_front/themes/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationFAB extends StatefulWidget {
  const NavigationFAB({
    super.key,
  });

  @override
  State<NavigationFAB> createState() => _NavigationFABState();
}

class _NavigationFABState extends State<NavigationFAB> {
  String _selectedTab = 'home';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.black02,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black01,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 0.1,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: _selectedTab == 'home' ? 0 : 55,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTab = 'home';
                              context.tabsRouter.navigate(HomeRoute());
                            });
                          },
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: TweenAnimationBuilder(
                              tween: ColorTween(
                                  begin: AppColors.black02,
                                  end: _selectedTab == 'home'
                                      ? AppColors.black02
                                      : AppColors.white),
                              duration: Duration(milliseconds: 300),
                              builder: (context, value, child) {
                                return Icon(
                                  Icons.home_outlined,
                                  color: value,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTab = 'calendar';
                              context.tabsRouter.navigate(CalendarRoute());
                            });
                          },
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: TweenAnimationBuilder(
                              tween: ColorTween(
                                  begin: AppColors.black02,
                                  end: _selectedTab == 'calendar'
                                      ? AppColors.black02
                                      : AppColors.white),
                              duration: Duration(milliseconds: 300),
                              builder: (context, value, child) {
                                return Icon(
                                  Icons.calendar_month_outlined,
                                  color: value,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  context.router.push(DiaryTopicSelectRoute());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.black02,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black01,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0.1,
                        )
                      ]),
                  width: 60,
                  height: 60,
                  child: const Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                )),
          ],
        ));
  }
}
