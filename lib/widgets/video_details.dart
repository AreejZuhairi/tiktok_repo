import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok_tut/models/video.dart';

class VideoDetails extends StatelessWidget {
  const VideoDetails({Key? key, required this.video}) : super(key: key);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "@${video.postedBy.username}",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          ExpandableText(
            video.caption,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w100),
            expandText: "more",
            collapseText: "less",
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
            maxLines: 2,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.music_note_2,
                color: Colors.white,
                size: 12,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 20,
                width: 50,
                child: Marquee(
                  text: '@${video.audioName}  .  ',
                  velocity: 10,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w100),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
