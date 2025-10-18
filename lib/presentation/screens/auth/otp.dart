import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
   const OtpScreen({super.key});

   @override
   State<OtpScreen> createState() => _OtpScreenState();

}


class _OtpScreenState extends State<OtpScreen> {
    final TextEditingController  otpController = TextEditingController();

    @override
    Widget build(BuildContext context){
      return(
        Scaffold(appBar: AppBar(title: const Text('OTP Verification'),),
           body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text( "OTP", 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                  shadows: [Shadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 3,
                  )],
                  ),
                  ),
                  TextField(
                    controller: otpController,
                    decoration: const InputDecoration(
                      labelText: 'Enter OTP',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle OTP verification
                    },
                    child: const Text('Verify OTP'),
                  ),
                ],
              ),
            ),
           ),
        
        )
      );
    }
}
