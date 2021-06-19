import 'package:excel_shortcuts_app/utils/constants/custom_colors.dart';
import 'package:excel_shortcuts_app/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
              fontFamily: "GilroyBold",
              color: CustomColors.cardColor,
              fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: CustomColors.cardColor),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 60,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                Strings.aboutUsDescription,
                style: TextStyle(
                    fontFamily: "GilroyLight",
                    color: CustomColors.cardShade,
                    fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontFamily: "GilroyLight",
                                fontSize: 14,
                                color: CustomColors.cardShade),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Website: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                text: 'www.businesscomputerskills.com',
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontFamily: "GilroyLight",
                                fontSize: 14,
                                color: CustomColors.cardShade),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Email: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                text: 'info@businesscomputerskills.com',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontFamily: "GilroyLight",
                              fontSize: 14,
                              color: CustomColors.cardShade),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Address : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text:
                                  '2340 S. Arlington Heights Rd.Suite 440 \nArlington Heights, IL 60005',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontFamily: "GilroyLight",
                              fontSize: 14,
                              color: CustomColors.cardShade),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Toll Fee: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: '577-442-3915',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontFamily: "GilroyLight",
                              fontSize: 14,
                              color: CustomColors.cardShade),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Fax: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: '847-779-0325',
                            ),
                          ],
                        ),
                      ),
                    ),
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
