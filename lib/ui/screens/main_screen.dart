// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_this
 
import 'package:expenses_tracking_app/consts/bottom_navigation_bar_consts.dart'; 
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/providers/bottom_navigation_bar_state.dart';
import 'package:expenses_tracking_app/providers/locale_state.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart'; 
import 'package:expenses_tracking_app/utils/helpers/product_shortcut_size_properties.dart';  
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/services/explore_service.dart.dart';   
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart';  
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';  
import 'package:expenses_tracking_app/ui/widgets/helpers/product_search.dart'; 
import 'package:expenses_tracking_app/ui/widgets/search_app_bar.dart';   
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainScreen extends StatefulWidget { 
  
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ExploreService exploreService = ExploreService();
  ProductResponse? productResponse; 

  @override
  void initState() { 
    super.initState();

    fetchData();
  }
  
  Future<void> fetchData() async {
    this.productResponse = await this.exploreService.getAllProducts(); 

    if(this.mounted) {
      setState(() { 

      });
    } 
  }

  @override
  Widget build(BuildContext context) {  

    this._initProductShortcutSizeProperties(MediaQuery.of(context).size.width); 
    Provider.of<BottomNavigationBarState>(context, listen: false).initNavigationItems(context: context);
    
    return Consumer<BottomNavigationBarState>(
     builder: ((context, BottomNavigationBarState bottomNavigationBarState, _) {
        return Scaffold(
          appBar: bottomNavigationBarState.selectedItemIndex == 0 
            ? SearchAppBar(label: "", searchDelegate: ProductSearch(productList: this.productResponse != null ? this.productResponse!.products : [])) 
            : bottomNavigationBarState.selectedItemIndex == 1
              ? CustomAppBar(label: AppLocalizations.of(context)!.yourCart)
              : bottomNavigationBarState.selectedItemIndex == 3
                ? CustomAppBar(label: AppLocalizations.of(context)!.yourProfile)
                : null,  
          bottomNavigationBar: Consumer<LocaleState>(
            builder: (context, LocaleState localeState, _) {
              // if we use "const" bottomNavigationBar will not be rebuilded in runtime!
              return CustomBottomNavigationBar();
            }  
          ),
          floatingActionButton: const QRScannerButton(), 
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          body: Container( 
            child: BottomNavigationBarConsts.screens[bottomNavigationBarState.selectedItemIndex]
          ),
        );
      }),   
    );
  } 

  void _initProductShortcutSizeProperties(double widthOfScreen) {
    ProductShortcutSizeProperties.shortcutImageHeight = widthOfScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    ProductShortcutSizeProperties.shortcutImageWidth = widthOfScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    ProductShortcutSizeProperties.shortcutTextHeight = SizeConsts.productShortcutTextHeight;  
    ProductShortcutSizeProperties.discountTagShift = widthOfScreen * SizeConsts.productShortcutTopPaddingRatio;
    ProductShortcutSizeProperties.discountTagRadius = widthOfScreen * SizeConsts.discountTagRadiusRation;
  }
}
 