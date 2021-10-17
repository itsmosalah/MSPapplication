import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:msp_ainshams/data/models/event_model/event_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';

import 'cubit/events_cubit.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsCubit()..getAllEvents(),
      child: BlocConsumer<EventsCubit, EventsState>(
        listener: (context, state) {},
        builder: (context, state) {

          EventsCubit model = EventsCubit.get(context);

          if(state is EventLoadingDataFromServer){
            return customLoadingData();
          }
          else if(state is EventsGetDataError){
            return getErrorFromServer(
              context: context,
            );
          }
          else{
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                  itemBuilder: (context,index)=>eventWidget(model: model.eventModel[index], context: context),
                  separatorBuilder:(context,index)=>verticalDivider(),
                  itemCount: model.eventModel.length
              ),
            );
          }
        },
      ),
    );
  }


  Widget eventWidget({
  required EventModel model,
  required context
}){
    return Container(
      width: double.infinity,
      height: 150.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.greenAccent.shade400,
            Colors.green.shade400,
            Colors.green.shade700,
          ],
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Row(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image(
                image: NetworkImage(model.img),
                errorBuilder:(context,object,stackTrace) {
                  return Image.asset("assets/images/MSP LOGO WHITE.png");
                },
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    model.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  model.fees == "0" ? Text(
                    "Free",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white
                    ),
                  ):Text(
                    "Fees:${model.fees}LE",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(
                right: 10.0
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "${DateTime.parse(model.createdAt).day}",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "${DateTime.parse(model.createdAt).month}",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${DateTime.parse(model.createdAt).hour}:00",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white
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


}
