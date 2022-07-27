import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/board/presentation/pages/all_tasks.dart';
import 'package:to_do_app/features/board/presentation/pages/completed_tasks.dart';
import 'package:to_do_app/features/board/presentation/pages/favorite_tasks.dart';
import 'package:to_do_app/features/board/presentation/pages/uncompleted_tasks.dart';

class BoardPage extends StatefulWidget {
  static String routeName ='/';
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> with TickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title:  Text(
          'Board',
          style: TextStyle(
            letterSpacing: 1,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon:  Icon(
                Icons.calendar_today,
                color: Colors.black,
                size: 20.sp,
              ))
        ],
        bottom:  TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All',),
            Tab(text: 'Completed',),
            Tab(text: 'Uncompleted',),
            Tab(text: 'Favorite'),
          ],
          indicatorColor: Colors.black,
          indicatorWeight: 2,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          labelStyle: TextStyle(color: Colors.black,fontSize: 15),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          AllTasks(),
          CompletedTasks(),
          UnCompletedTasks(),
          FavoriteTasks(),
        ],
      ),
    );
  }
}
