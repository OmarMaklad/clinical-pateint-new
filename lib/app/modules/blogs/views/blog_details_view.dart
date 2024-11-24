import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/blogs_controller.dart';

class BlogDetailsView extends GetView<BlogController> {
  @override
  Widget build(BuildContext context) {
    Blog? blog = ModalRoute.of(context)?.settings.arguments as Blog?;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${blog?.title}',
            style: context.textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
              onPressed: () => Get.back()),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: blog?.id.toString() ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    height: 150,
                    width: 300,
                    fit: BoxFit.cover,
                    imageUrl: blog?.image ?? '',
                    placeholder: (context, url) => Image.asset(
                      'assets/img/loading.gif',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 80,
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error_outline),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                child: Row(
                  children: [
                    Text('${blog?.createdBy}' ?? '',
                        style: Get.textTheme.titleMedium),
                    Text('${blog?.articleCategoryId}',
                        style: Get.textTheme.titleMedium),
                  ],
                ),
              ),

              Divider(),
              Html(data: blog?.description, style: {
                "table": Style(
                  fontSize: FontSize.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                // some other granular customizations are also possible
                "tr": Style(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  fontSize: FontSize.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "th": Style(
                  padding: EdgeInsets.all(6),
                  fontSize: FontSize.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor: Colors.grey,
                ),
                "td": Style(
                  fontSize: FontSize.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                  padding: EdgeInsets.all(6),
                  // alignment: Alignment.topLeft,
                ),
                // text that renders h1 elements will be red
                "h1": Style(
                  fontSize: FontSize.medium,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "h2": Style(
                  fontSize: FontSize.larger,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "h3": Style(
                  fontSize: FontSize.larger,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "h4": Style(
                  fontSize: FontSize.larger,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "h5": Style(
                  fontSize: FontSize.larger,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "h6": Style(
                  fontSize: FontSize.larger,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  // backgroundColor:
                  // Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
              }),

              //TODO: for video implementation
              // if (_articleDetails.isVideo == 1 &&
              //     _controller.value.isInitialized)
              //   Padding(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 24, vertical: 6),
              //     child: Container(
              //       height: 200,
              //       width: 400,
              //       child: Stack(
              //         children: [
              //           VideoPlayer(_controller),
              //           Positioned(
              //             top: MediaQuery.of(context).size.height * .18,
              //             left: 0,
              //             right: 0,
              //             child: Container(
              //               color: Colors.black54,
              //               child: IconButton(
              //                 // color: kcPrimary,
              //                 onPressed: () {
              //                   setState(() {
              //                     _controller.value.isPlaying
              //                         ? _controller.pause()
              //                         : _controller.play();
              //                   });
              //                 },
              //                 icon: Icon(
              //                   color: Colors.white,
              //                   _controller.value.isPlaying
              //                       ? Icons.pause
              //                       : Icons.play_arrow,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
            ],
          ),
        ));
  }
}
