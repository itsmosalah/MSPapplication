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
            return ListView.separated(
                itemBuilder: (context,index)=>eventWidget(model: model.eventModel[index], context: context),
                separatorBuilder:(context,index)=>verticalDivider(),
                itemCount: model.eventModel.length
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
      height: 300.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.greenAccent,
            Colors.green.shade400,
            Colors.green.shade700,
            Colors.green.shade900,
          ],
        )
      ),
      child: Row(
        children: [
          SizedBox(
            width: 250,
            height: 250,
            child: Image(
              image: NetworkImage(model.img),
              errorBuilder:(context,object,stackTrace) {
                return Image.asset("assets/images/MSP LOGO WHITE.png");
              },
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Column(
              children: [
                Text(
                  model.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  model.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                model.fees == 0 ? Text(
                  "Free",
                  style: Theme.of(context).textTheme.subtitle1,
                ):Text(
                  "Fees: ${model.fees} EGP",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                  "${DateFormat.d(model.createdAt)}",
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "${DateFormat.m(model.createdAt)}",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                "${DateFormat.Hm(model.createdAt)}",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),

        ],
      ),
    );
  }


}
