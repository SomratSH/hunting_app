import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_button.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_snackBar.dart';
import 'package:hunting_app/constant/app_colors.dart';
import 'package:hunting_app/presentation/home_screen/home_provider.dart';
import 'package:hunting_app/presentation/landing_page/landing_page.dart';
import 'package:provider/provider.dart';

class PriceClamSucess extends StatefulWidget {
  const PriceClamSucess({super.key});

  @override
  State<PriceClamSucess> createState() => _PriceClamSucessState();
}

class _PriceClamSucessState extends State<PriceClamSucess> {
  // Function to show the rating modal
  void _showRatingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Ensure that the modal listens to changes in the provider
        return Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                color: const Color(0xFF111827),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildModalHeader(context),
                    vPad20,
                    _buildModalDescription(),
                    vPad15,
                    _buildRatingStars(provider),
                    const SizedBox(height: 20),
                    _buildActionButtons(context, provider),
                    vPad50,
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Modal header with close icon and title
  Widget _buildModalHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rate This Hunt!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.26,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w600,
            height: 1.60,
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: Colors.grey.shade300),
        ),
      ],
    );
  }

  // Modal description text
  Widget _buildModalDescription() {
    return SizedBox(
      width: 362.18,
      child: Text(
        'Help us improve our tool to best suit your needs by rating us here!',
        style: TextStyle(
          color: const Color(0xFFC9C9C9),
          fontSize: 13.49,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
          height: 1.43,
        ),
      ),
    );
  }

  // Rating stars
  Widget _buildRatingStars(HomeProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () => provider.updateRating((index + 1).toString()),
          child: Icon(
            index < int.parse(provider.rating.toString()) ? Icons.star : Icons.star_border,
            color: Color(0xffFB9506),
            size: 40,
          ),
        );
      }),
    );
  }

  // Action buttons: Cancel and Submit
  Widget _buildActionButtons(BuildContext context, HomeProvider provider) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (_) => LandingPage()),
  (Route<dynamic> route) => false, // This removes all the previous routes
),

            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: appBgColor),
                  ),
                ),
              ),
            ),
          ),
        ),
        hPad10,
        Expanded(
          child:  InkWell(
            onTap: ()async{
              final response = await  provider.submitRatingApi("3606dd93-1c21-4735-9e95-bdf9c7d90f80");
              // final response = await  provider.submitRatingApi("7bac2595-fad8-47bb-a7ab-941f079d1e41");
              print("response");
              if(response["id"] != null){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=> LandingPage()),  (Route<dynamic> route) => false,);
              }else if(response["error"] != null){
                Navigator.pop(context);
                CustomSnackbar.show(context, message: response["error"], backgroundColor: Colors.red);
              }
              
                          },
            child:  DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white),
                color: blue3,
              ),
              child: provider.isRatingLoading ? Center(child: CircularProgressIndicator()) : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ), 
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // Delay the showRatingModal until after the frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showRatingModal(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3B6074), Color(0xff0B2438), Color(0xff041119)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              // Background image with opacity
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/splash_bg.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              vPad15,
              // Your content
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Image.asset("assets/splash_text_two.png"),
                    vPad20,
                    Divider(color: blue3.withOpacity(0.5)),
                    vPad50,
                    Text(
                      'Prize Claim\nSuccessful',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF97BECA),
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                           Expanded(
                             child: CustomButton(
                               buttonText: "Back to Home",
                               onPressed: () =>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> LandingPage()),(v) => false),
                             ),
                           ),
                           hPad10,
                          Expanded(
                            child: CustomButton(
                              buttonText: "Give Your Rating",
                              
                              onPressed: () => _showRatingModal(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    vPad20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
