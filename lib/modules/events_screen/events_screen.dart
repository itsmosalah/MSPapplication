import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msp_ainshams/data/models/event_model/event_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/modules/event_details_screen/event_details_screen.dart';

import 'cubit/events_cubit.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsCubit, EventsState>(
      listener: (context, state) {},
      builder: (context, state) {
        EventsCubit model = EventsCubit.get(context);

        if (state is EventLoadingDataFromServer) {
          return customLoadingData(
            color: Colors.teal
          );
        } else if (state is EventsGetDataError) {
          return getErrorFromServer(
            context: context,
          );
        } else {
          return  Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetailsScreen(model: model.eventModel[index],)));
                    },
                    child: Hero(
                      tag:model.eventModel[index].id,
                      child: eventWidget(
                          model: model.eventModel[index], context: context),
                    ),
                  ),
                  separatorBuilder: (context, index) => verticalDivider(),
                  itemCount: model.eventModel.length),
            );
        }
      },
    );
  }

  Widget eventImage({required String imageUrl}) => Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Image(
          image: NetworkImage(imageUrl),
          errorBuilder: (context, object, stackTrace) {
            return Image.asset("assets/images/MSP LOGO WHITE.png");
          },
          fit: BoxFit.cover,
        ),
      );

  Widget eventInfo({
    required model,
    required context,
  }) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            model.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.white,
                fontSize: 9.0,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10.0,
          ),
          model.fees == "0"
              ? Text(
                  "Free",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                )
              : Text(
                  "Fees:${model.fees}LE",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.white),
                ),
        ],
      );

  Widget eventDateDetails({required model,required context})=>Container(
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
          "${DateTime.parse(model.createdAt).hour}:00",
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: Colors.white),
        ),
      ],
    ),
  );

  Widget eventContainer({required model,context})=>Container(
    width: double.infinity,
    height: 150.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.teal.shade400,
            Colors.teal.shade700,
            Colors.teal.shade900,
          ],
        )),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Row(
        children: [
          eventImage(
            imageUrl: model.img,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: eventInfo(
              context: context,
              model: model,
            ),
          ),
          eventDateDetails(
            context: context,
            model: model,
          ),
        ],
      ),
    ),
  );

  Widget eventWidget({required EventModel model, required context}) {
    return eventContainer(
      context: context,
      model: model,
    );
  }
}
