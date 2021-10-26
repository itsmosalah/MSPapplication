import 'package:flutter/material.dart';
import 'package:msp_ainshams/data/models/crew_model/crew_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/data/shared/cubit/app_cubit.dart';


// ignore: must_be_immutable
class CrewDetailsScreen extends StatelessWidget {
  late CrewModel model;
  CrewDetailsScreen({Key? key,required this.model}) : super(key: key);


  List<String> modelData=[];
  List<IconData>icons=[
    Icons.person,
    Icons.work_outlined,
    Icons.star,
    Icons.mail,
    Icons.phone
  ];
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
                image: NetworkImage(model.img),
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

    modelData = fillModelData();

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
                        Row(
                          children: [
                            Icon(
                              icons[0],
                              color: Colors.grey,
                            ),
                            horizontalDivider(),
                            Text(
                              modelData[0],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height:25.0
                        ),
                        Row(
                          children: [
                            Icon(
                              icons[1],
                              color: Colors.grey,
                            ),
                            horizontalDivider(),
                            Text(
                              modelData[1],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        const SizedBox(
                            height:25.0
                        ),
                        Row(
                          children: [
                            Icon(
                              icons[2],
                              color: Colors.grey,
                            ),
                            horizontalDivider(),
                            Text(
                              modelData[2],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        const SizedBox(
                            height:25.0
                        ),
                        Row(
                          children: [
                            Icon(
                              icons[3],
                              color: Colors.grey,
                            ),
                            horizontalDivider(),
                            Expanded(
                              child: Text(
                                modelData[3],
                                style: Theme.of(context).textTheme.bodyText1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height:25.0
                        ),
                        Row(
                          children: [
                            Icon(
                              icons[4],
                              color: Colors.grey,
                            ),
                            horizontalDivider(),
                            Text(
                              modelData[4],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        const SizedBox(
                            height:50.0
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
                          decoration:  BoxDecoration(
                              color: AppCubit.get(context).isDark!?Colors.white:Colors.black,
                              borderRadius: const BorderRadius.horizontal(
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
                  const SizedBox(
                    height: 100.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> fillModelData()=>[
    model.position,
    model.committee,
    model.department +"-"+model.year.toString(),
    model.mail,
    model.phone
  ];
  Widget buildDetails({
  required BuildContext context,
  required IconData icon,
  required String text,
})=>Padding(
  padding: const EdgeInsets.symmetric(
      horizontal: 10.0),
  child:   Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        horizontalDivider(),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    ),
);

}