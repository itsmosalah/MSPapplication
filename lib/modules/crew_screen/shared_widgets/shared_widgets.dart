import 'package:flutter/material.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/modules/crew_screen/crew_details_screen/crew_details_screen.dart';

Widget memberPhoto({required String imageUrl}) => Container(
      width: 100,
      height: 100,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(
          width: 100,
          image: NetworkImage(imageUrl),
          errorBuilder: (context, object, stackTrace) {
            return Image.asset("assets/images/MSP LOGO WHITE.png");
          },
          fit: BoxFit.cover,
        ),
      ),
    );

Widget memberDetails(
        {required String name,
        required String committee,
        required String position,
        required context}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.0,
                color: committee == "Web" ? Colors.black : Colors.white,
              ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        verticalDivider(),
        Text(
          committee,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 12.0,
                color: committee == "Web" ? Colors.black : Colors.white,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalDivider(),
        Text(
          position,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 12.0,
                color: committee == "Web" ? Colors.black : Colors.white,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );

Widget crewContainer({required model, required context}) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CrewDetailsScreen(model: model)));
      },
      child: Hero(
        tag: model.id,
        child: Container(
          height: 150.0,
          decoration: BoxDecoration(
            color: getCommitteeColor(committee: model.committee),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                memberPhoto(imageUrl: model.img),
                const SizedBox(
                  width: 25.0,
                ),
                Expanded(
                  child: memberDetails(
                      context: context,
                      name: model.name,
                      committee: model.committee,
                      position: model.position),
                ),
                horizontalDivider(),
              ],
            ),
          ),
        ),
      ),
    );
