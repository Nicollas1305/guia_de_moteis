import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/motel_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final motelProvider = Provider.of<MotelProvider>(context);

    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {},
      ),
      title: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                motelProvider.toggleIsNowSelected();
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 40,
                        decoration: BoxDecoration(
                          color: motelProvider.isNowSelected
                              ? Colors.transparent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: motelProvider.isNowSelected
                                  ? Colors.white
                                  : Colors.black,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'ir agora',
                              style: TextStyle(
                                color: motelProvider.isNowSelected
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 40,
                        decoration: BoxDecoration(
                          color: motelProvider.isNowSelected
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: motelProvider.isNowSelected
                                  ? Colors.black
                                  : Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'ir outro dia',
                              style: TextStyle(
                                color: motelProvider.isNowSelected
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
