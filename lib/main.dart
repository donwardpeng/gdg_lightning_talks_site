import 'package:flutter/material.dart';
import 'sessions.dart';
import 'dart:html';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDG Windsor - Evening of Lightning Talks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GDG Windsor - Evening of Lightning Talks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Session> sessions = [
    Session(
        'Eric Brisco',
        'Eric Brisco is a QA Analyst & IoT Developer at Corum Digital',
        'assets/eric.jpeg',
        'PureScript in a Nutshell',
        'In this session Eric will cover what makes PureScript special as a language, an overview of the tooling, and show a couple examples.'),
    Session(
        'Samaa Elattar',
        '',
        'assets/female.png',
        'Using Holograms to Revolutionize the Teaching World',
        'In this session, Samaa will discuss a hologram project she is working on that will revolutionize the teaching world and help students with courses that need imagination. \n\nThis will allow students to see and interact with everything they get theoretically in books.'),
    Session(
        'John Haldeman',
        'John Haldeman is a data security architect who\'s job it is to analyze and build systems to analyze security event data. Outside of work he is interested in doing the same but with open social data for communities across Ontario and Canada. He was awarded the IBM Champion designation for 2013-2019 for his outstanding contributions to the data security community.',
        'assets/john.jpg',
        'Visualizing Open Data: How it is used on www.oncitybooks.ca',
        'In this session, John will talk about visualizations using tools and libraries like D3 and React. He will look specifically at how oncitybooks.ca was built and some other interesting visualizations using open data.'),
    Session(
        'Karmanjot Singh',
        'Karman is currently studying MSc. in Computer Science at the University of Windsor with a research focus on Differential Privacy and its applications. He worked as a Software Developer for about 4 years at Deloitte. He has a keen interest in Machine Learning and Artificial Intelligence.',
        'assets/karman.jpg',
        'Differential Policy in a Nutshell',
        'In this session, Karman will cover what Differential Policy is, why it is important and show some examples'),
    Session(
        'Jesse Thompson',
        'Jesse Thompson is the Founder & CEO of Fetch Moto Inc. (formerly HaggeFree).  Fetch Moto is a company focused on improving the customer journey for vehicle buyers.  Before writing any code at all, Jesse was able to sell his software product to multiple auto dealerships and validate his business idea through the use of high-fidelity prototypes.',
        'assets/jesse.jpg',
        'Using Adobe XD to Create High-Fidelity Prototypes',
        'In this quick lightning talk Jesse will give an overview on how to prototype with Adobe XD and discuss his journey towards product-market fit.'),
  ];

  String eventHeader =
      'Join the Windsor GDG for a evening of lightning talks and project demos from our members!';
  String eventDescription =
      'Every software developer we know has a side project that they are passionate about. It could be learning a real cool new coding language to building the next big thing.\n\nJoin us as we host a round of lightning talks (15 minutes in duration) with the following members from the local software development community. They will be showing and demonstrating their side projects. The goal is to learn, encourage and generally geek out on technology.';

  String eventDate = 'Wednesday, January 29, 2020';
  String eventTime = '6:30 PM to 8:30 PM';
  String eventLocation = 'EPICentre, 2455 Wyandotte St W · Windsor, ON';
  String eventRSVP = 'https://www.meetup.com/GDG-Windsor/events/265924261/';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var large_screen = size.width > 600;
    // set the number of elements in the gridview crossaxis count
    int gridViewCount = large_screen ? 3 : 1;
    //make the cards 1/2 the height of the view
    final double cardHeight = large_screen ? size.height / 1.75 : size.height/2;
    //make the card the scaled to the width divided by the number of gridview elements across
    final double cardWidth = size.width / (gridViewCount + 1);

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text(
                'RSVP Here!',
                style: Theme.of(context)
                    .textTheme
                    .title
                    .apply(color: Colors.white),
              ),
              onPressed: () {
                window.open(eventRSVP, 'RSVP Url');
              },
            )
          ],
          title: Text(large_screen? widget.title : ''),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              large_screen ? Expanded(
                flex: 3,
                child: SizedBox(
                    width: size.width / 3,
                    height: size.height / 2.5,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(24, 8, 16, 16),
                        child: Card(
                            color: Colors.white,
//                            margin: EdgeInsets.all(24),
                            child: Column(children: <Widget>[
                              Container(
                                  width: size.width / 3,
                                  height: size.height / 2.75,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'assets/gdg_windsor.png')))),
                            ])))),
              ) : Container(),
              Expanded(
                  flex: 6,
                  child: SizedBox(
                      width: 2 * size.width / 3,
                      height: large_screen? size.height / 2.5 : size.height / 1.3,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 24, 16),
                          child: Card(
                              color: Colors.white,
                              child: Center(child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                                child: RichText(
                                    text: TextSpan(
                                        text: eventHeader,
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1
                                            .copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: '\n\n' + eventDescription,
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(fontSize: 18)),
                                      TextSpan(
                                          text: '\n\nWhen: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(fontSize: 18)),
                                      TextSpan(
                                          text: eventDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(fontSize: 18)),
                                      TextSpan(
                                          text: ', ' + eventTime,
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(fontSize: 18)),
                                      TextSpan(
                                          text: '\nLocation: ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(fontSize: 18)),
                                      TextSpan(
                                          text: eventLocation,
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(fontSize: 18)),
                                    ]))),
                              )))))
              ]),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: gridViewCount,
                    childAspectRatio: (cardWidth / cardHeight),
                    children: sessions
                        .map(
                          (element) => Card(
                            color: Colors.white,
                            margin: EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
                                  child: Container(
                                      width: cardWidth,
                                      height: cardHeight / 1.75,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  element.headshot)))),
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
                                    child: Text(
                                        element.session_title +
                                            ' by ' +
                                            element.speaker_name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .display1
                                            .copyWith(fontSize: 28))),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
                                  child: Text(
                                      element.session_description +
                                          '\n\n' +
                                          element.bio,
                                      style: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(fontSize: 16)),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList())),
          ]),
        ));
  }
}
