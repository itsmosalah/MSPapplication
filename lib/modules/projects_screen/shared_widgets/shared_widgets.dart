import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';

Widget projectPhoto({required String imageUrl}) => Container(
  width: 100,
  height: 100,
  decoration:const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.black
  ),
  child: Image(
    width: 100,
    image: NetworkImage(imageUrl),
    errorBuilder: (context, object, stackTrace) {
      return Image.asset("assets/images/MSP LOGO WHITE.png");
    },
    fit: BoxFit.cover,
  ),
);


Widget projectDetails({
  required String projectTitle,
  required String committee,
  required context
})=> Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      projectTitle,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        color: Colors.white,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    verticalDivider(),
    Text(
      committee,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
        color: Colors.white,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    verticalDivider(),

  ],
);


Widget projectDateDetails({required model,required context})=>Container(
  margin: const EdgeInsets.only(right: 20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        "${DateTime.parse(model.createdAt).day}",
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(color: Colors.white),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Text(
        getMonthName(month: DateTime.parse(model.createdAt).month),
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: Colors.white),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Text(
        DateFormat.Hm().format(DateTime.parse(model.createdAt)),
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(color: Colors.white),
      ),
    ],
  ),
);

Widget projectContainer({required model,required context})=> Container(
  height: 150.0,
  decoration: BoxDecoration(
    color: getCommitteeColor(committee: model.team),
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
      children: [
        projectPhoto(
            imageUrl:model.photo
        ),
        horizontalDivider(),
        Expanded(
          child:projectDetails(
            context: context,
            projectTitle: model.name,
            committee: model.team,
          ),
        ),
        const Spacer(),
        projectDateDetails(
            context: context,
            model: model
        ),
      ],
    ),
  ),
);