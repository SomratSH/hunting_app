










import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hunting_app/common/custom_snackBar.dart';

import 'package:webview_flutter/webview_flutter.dart';

class StripePaymentWebView extends StatefulWidget {
  final String url;
  final void Function()? onSuccess;

  const StripePaymentWebView({Key? key, required this.url, this.onSuccess}) : super(key: key);

  @override
  State<StripePaymentWebView> createState() => _StripePaymentWebViewState();
}

class _StripePaymentWebViewState extends State<StripePaymentWebView> {
  late final WebViewController _controller;
  bool isLoading = true;
  bool hasShownError = false; // Prevent duplicate error messages
  
  // Use the actual URL from your backend/Stripe success redirect
  final String successUrlPattern = 'http://10.10.13.19:8000/status=success';

  // Professional SnackBar helper methods
  void _showSuccessSnackBar() {
    CustomSnackbar.show(context,message:  "Payment Successful!\nYour subscription has been activated");
   
  }

  void _showCancelledSnackBar() {
    CustomSnackbar.show(
   message: 
      'Payment Cancelled\nYou can try again anytime',
      context
      ,
    );
  }

  // void _showErrorSnackBar(String message) {
  //   // Reset error flag when showing error
  //   hasShownError = true;
  //   SnackBarUtils.showErrorSnackBar(
  //     context,
  //     'Payment Error',
  //     message,
  //     onRetry: () {
  //       hasShownError = false; // Reset flag when retrying
  //       _controller.reload();
  //     },
  //   );
  // }

  // void _showConnectionErrorSnackBar(String message) {
  //   if (!hasShownError) {
  //     hasShownError = true;
  //     SnackBarUtils.showErrorSnackBar(
  //       context,
  //       'Connection Error',
  //       'Unable to connect to payment gateway. Please check your internet connection.',
  //       onRetry: () {
  //         hasShownError = false;
  //         _controller.reload();
  //       },
  //     );
  //   }
  // }

  @override
  void initState() {
    super.initState();
    
    // Set a timeout for initial loading
    Future.delayed(Duration(seconds: 30), () {
      if (isLoading && mounted) {
        setState(() {
          isLoading = false;
        });
        if (!hasShownError) {
          // _showConnectionErrorSnackBar('Page load timeout');
        }
      }
    });
    
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar if needed
          },
          onPageStarted: (String url) {
            print('WebView page started loading: $url'); // Debugging
            if (mounted) {
              setState(() {
                isLoading = true;
                hasShownError = false; // Reset error flag on new page load
              });
            }
          },
          onPageFinished: (String url) {
            print('WebView page finished loading: $url'); // Debugging
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            print('WebView error: ${error.description}'); // Debugging
            
            // Ignore minor resource loading errors and Stripe's internal redirects
            if (error.description.contains('favicon') || 
                error.description.contains('analytics') ||
                error.description.contains('tracking') ||
                error.description.contains('stripe.com/analytics')) {
              return;
            }
            
            // Only show error for significant connection issues
            if (!hasShownError && 
                (error.description.contains('net::ERR_CONNECTION_REFUSED') || 
                 error.description.contains('net::ERR_TIMED_OUT') ||
                 error.description.contains('net::ERR_NETWORK') ||
                 error.description.contains('ERR_CONNECTION'))) {
              // _showConnectionErrorSnackBar(error.description);
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            print('WebView navigation request: ${request.url}'); // Debugging
            if (request.url.startsWith(successUrlPattern)) {
              print('Payment Successful: Navigating to home screen');
              _showSuccessSnackBar();
              if (widget.onSuccess != null) widget.onSuccess!();
              // Navigate to home screen and remove all previous routes
              Navigator.of(context).pop(true); // Return true to indicate success
              return NavigationDecision.prevent;
            }
            // Check for cancel patterns
            if (request.url.contains('cancel') || 
                request.url.contains('payment_cancel') ||
                request.url.contains('checkout/cancel')) {
              print('Payment Cancelled');
              _showCancelledSnackBar();
              Navigator.of(context).pop(false); // Return false to indicate cancellation
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.payment,
              color: Colors.green,
             
            ),
            SizedBox(width: 12),
            Text(
              'Secure Payment',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black54,
      
          ),
          onPressed: () {
            // Don't show cancellation message if user just closes without starting payment
            if (!isLoading) {
              _showCancelledSnackBar();
            }
            Navigator.of(context).pop(false);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.black54,
           
            ),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (isLoading)
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                          strokeWidth: 3,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Loading Payment Gateway...',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Please wait while we connect securely',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }



} 











