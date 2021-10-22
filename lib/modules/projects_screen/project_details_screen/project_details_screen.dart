import 'package:flutter/material.dart';
import 'package:msp_ainshams/data/models/project_model/project_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/data/shared/network/web_view/web_view.dart';

// ignore: must_be_immutable
class ProjectDetailsScreen extends StatelessWidget {
  late ProjectModel model;
  ProjectDetailsScreen({Key? key,required this.model}) : super(key: key);

 buildSliverAppBar({required context}) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          model.name,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        background: Hero(
            tag: model.id,
            child: Container(
              color: Colors.grey,
              child: Image(
                image: NetworkImage(model.photo),
                errorBuilder: (context, object, stackTrace) {
                  return Image.asset("assets/images/MSP LOGO WHITE.png");
                },
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            buildSliverAppBar(context: context),
            SliverList(
              delegate:SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0
                              ),
                              child: Text(
                                model.description,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade400,
                                    height: 1.3,
                                    fontFamily: 'RailWay',
                                ),
                            ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Text(
                          'Committee: '+model.team,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Project Link',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              buildProjectLink(
                                  url: model.link,
                                  context: context
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Follow Us ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        verticalDivider(),
                        SizedBox(
                          height: 50,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context,index)=>buildSocialMediaButtons(
                                imageLink: socialNetworkImages[index],
                                url:socialMediaLinks[index],
                                context: context,
                              ),
                              separatorBuilder: (context,index)=>const SizedBox(width: 5.0,),
                              itemCount: 3
                          ),
                        ),

                        const SizedBox(
                          height: 50.0,
                        ),

                        Container(
                          height: 2.0,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 25.0
                          ),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(5.0),
                                  right: Radius.circular(5.0)
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        buildSlogan(
                            context: context
                        ),

                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProjectLink({
    required String  url,
    required context
  })=> InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewHelper(
        url: url,
      )));
    },
    child: const CircleAvatar(
      backgroundImage: NetworkImage("https://icons-for-free.com/iconfiles/png/512/git+github+icon-1320191654571298174.png"),
      radius: 24.0,
      backgroundColor: Colors.transparent,
    ),
  );

}