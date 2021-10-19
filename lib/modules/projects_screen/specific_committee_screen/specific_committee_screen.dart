import 'package:flutter/material.dart';
import 'package:msp_ainshams/data/models/project_model/project_model.dart';
import 'package:msp_ainshams/data/shared/constants/constants.dart';
import 'package:msp_ainshams/modules/projects_screen/shared_widgets/shared_widgets.dart';

// ignore: must_be_immutable
class SpecificCommitteeScreen extends StatelessWidget {
  late List<ProjectModel> model;
  late String committeeName;
  SpecificCommitteeScreen({Key? key,required this.model,required this.committeeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          committeeName,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: builderForThisScreen(
          context: context,
        ),
      ),
    );
  }

  Widget builderForThisScreen({
  required context,
}){
    if(model.isEmpty){
      return Center(
        child: Text(
          'Sorry There\'s no projects yet from this committee ',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      );
    }
    else{
      return Column(
        children: [
          Text(
            "All Projects",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 25.0,
          ),

          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>projectContainer(
                  context: context,
                  model: model[index],
                ),
                separatorBuilder: (context,index)=>verticalDivider(),
                itemCount: model.length),
          )

        ],
      );
    }
  }
}
