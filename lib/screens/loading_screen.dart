import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sparkpay/core/constants.dart';
import 'package:sparkpay/core/routes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KilitEkranArkaPlanRengi, // Arka plan rengi
      body: SizedBox.expand(
        //width: double.infinity,
        child: Column(
          children: [
            // Logo bölümü
            Expanded(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/logo.webp',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            
            

          
          
            
          const Text("SparkPay Hesabınıza Giriş Yapmak İçin Tıklayın!",  
           style: TextStyle(
          fontSize: 20,
        fontWeight: FontWeight.bold,  
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    ),

            //Boşluk bırakmak için
            const SizedBox(height: 150),
            
            
                InkWell(
                  onTap: ()=>context.go("/home"),
                  child: SizedBox(
                    width:275,
                    child: DotLottieLoader.fromAsset(
                      "motions/lockscreen.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                                  }),
                  ),
                ),

            //Boşluk bırakmak için
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}