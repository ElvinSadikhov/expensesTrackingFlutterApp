import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:expenses_tracking_app/data/mock_data.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/rounded_image_frame.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';


class AccountInfoBlock extends StatelessWidget {
  const AccountInfoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(  
        children: [ 
          const RoundedImageFrame(image: AssetImage('assets/images/profile_photo.jpg'), size: 100),
          WidgetMethods.horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                Strings.username + ": " + MockData.username, 
                style: TextStyleConsts.profileInfoStyle,
              ),
              WidgetMethods.verticalSpace(15),
              const Text(
                Strings.gmail + ": " + MockData.gmail,  
                overflow: TextOverflow.ellipsis,
                style: TextStyleConsts.profileInfoStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}