import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_tut/_mock_data/mock.dart';
import 'package:tiktok_tut/widgets/home_slide_bar.dart';
import 'package:tiktok_tut/widgets/video_details.dart';
import 'package:tiktok_tut/widgets/video_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFollowingSelected = true;
  int _snapPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isFollowingSelected = true;
                  })
                },
                child: Text(
                  "Following",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: _isFollowingSelected ? 18 : 14,
                        color:
                            _isFollowingSelected ? Colors.white : Colors.grey,
                      ),
                ),
              ),
              Text(
                "  |  ",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
              ),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    _isFollowingSelected = false;
                  })
                },
                child: Text(
                  "For you",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: !_isFollowingSelected ? 18 : 14,
                        color:
                            !_isFollowingSelected ? Colors.white : Colors.grey,
                      ),
                ),
              ),
            ],
          )),
      body: PageView.builder(
          onPageChanged: (int page) => {
            _snapPageIndex = page,
            print("page changed to $page")},
          scrollDirection: Axis.vertical,
          itemCount: videos.length,
          itemBuilder: (context, index) {
            return Stack(alignment: Alignment.bottomCenter, children: [
              // Container(
              //   color: Colors.purple,
              // ),
              VideoTile(
                video: videos[index],
                currentIndex: index,
                snappedPageIndex: _snapPageIndex,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: VideoDetails(
                        video: videos[index],
                      ),
                      height: MediaQuery.of(context).size.height / 4.0,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.75,
                      child: HomeSlideBar(
                        video: videos[index],
                      ),
                    ),
                  )
                ],
              )
            ]);
          }),
    );
  }
}
