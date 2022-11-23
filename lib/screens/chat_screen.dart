import 'package:diary_chat/models/models.dart';
import 'package:diary_chat/theme.dart';
import 'package:diary_chat/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

class ChatScreen extends StatefulWidget {
  static Route route(MessageData data) => MaterialPageRoute(
        builder: (context) => ChatScreen(),
      );

  const ChatScreen({
    Key? key,
  }) : super(key: key);

  // final FirebaseApp app;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  List<Message> messages = [];
  final database = FirebaseDatabase.instance.ref();
  String userUID = '';
  String chatUID = '';
  bool _isFirstBuild = true;
  DatabaseReference newRef = FirebaseDatabase.instance.ref('diaries/');
  DialogflowGrpcV2Beta1? dialogflow;

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      var temp = FirebaseAuth.instance.currentUser?.uid;
      userUID = temp.toString();
    }
    _activateListeners();
    initPlugin();
  }

  void _activateListeners() {
    database.child('users/').onValue.listen((event) {
      if (event.snapshot.hasChild(userUID)) {
        chatUID = event.snapshot.child(userUID + '/chatUID').value.toString();
      } else {
        chatUID = database.child('users/' + userUID).push().key.toString();
        database.child('users/' + userUID).set({'chatUID': chatUID});
        // database.child('users/' + userUID).update({'user': userName});
      }

      database.child('diaries/$chatUID').onValue.listen((event1) {
        if (_isFirstBuild) {
          _isFirstBuild = false;
          newRef = newRef.child(chatUID).push();
          for (var child in event1.snapshot.children) {
            final String user = child.child('userUID').value.toString();
            final String time = child.child('time').value.toString();
            final String message = child.child('message').value.toString();
            setState(() {
              messages.insert(
                  0,
                  Message(
                      id: user,
                      createdAt: DateTime.tryParse(time),
                      text: message));
            });
          }
        }
      });
    });
  }

  Future<void> initPlugin() async {
    // _recorderStatus = _recorder.status.listen((status) {
    //   if (mounted)
    //     setState(() {
    //       _isRecording = status == SoundStreamStatus.Playing;
    //     });
    // });

    // await Future.wait([
    //   _recorder.initialize()
    // ]);

    // TODO Get a Service account
    // Get a Service account
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/credentials1.json'))}');
    // Create a DialogflowGrpc Instance
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  // void stopStream() async {
  //   await _recorder.stop();
  //   await _audioStreamSubscription?.cancel();
  //   await _audioStream?.close();
  // }

  void handleSubmitted(text) async {
    print(text);
    _textController.clear();

    //TODO Dialogflow Code
    DetectIntentResponse data = await dialogflow!.detectIntent(text, 'en-US');
    String fulfillmentText = data.queryResult.fulfillmentText;
    if (fulfillmentText.isNotEmpty) {
      setState(() {
        messages.insert(0,
            Message(id: '1', createdAt: DateTime.now(), text: fulfillmentText));
        newRef.set({
          "userUID": '1',
          "time": DateTime.now().toString(),
          "message": fulfillmentText
        });
      });
    }
  }

  // void handleStream() async {
  //   _recorder.start();

  //   _audioStream = BehaviorSubject<List<int>>();
  //   _audioStreamSubscription = _recorder.audioStream.listen((data) {
  //     print(data);
  //     _audioStream.add(data);
  //   });

  //   // TODO Create SpeechContexts
  //   // Create an audio InputConfig

  //   // TODO Make the streamingDetectIntent call, with the InputConfig and the audioStream
  //   // TODO Get the transcript and detectedIntent and show on screen

  // }

  @override
  Widget build(BuildContext context) {
    var myFocusNode = FocusNode();
    if (!_isFirstBuild) {
      newRef = FirebaseDatabase.instance.ref('diaries/' + chatUID).push();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: AppColors.primary,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.arrow_back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Back',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  height: 25,
                  child: IconBorder(
                    icon: CupertinoIcons.ellipsis,
                    onTap: () {},
                  ),
                ),
                Text(
                  'Setting',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _MessageList(messages: messages),
          ),
          SafeArea(
            bottom: true,
            top: false,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 2,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(CupertinoIcons.plus,
                        size: 33, color: AppColors.primary),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 10),
                    child: TextField(
                      focusNode: myFocusNode,
                      controller: _textController,
                      style: TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: 'Type something...',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => setState(() {
                        if (_textController.text.isNotEmpty) {
                          messages.insert(
                              0,
                              Message(
                                  id: '0',
                                  createdAt: DateTime.now(),
                                  text: _textController.text));
                          newRef.set({
                            "userUID": '0',
                            "time": DateTime.now().toString(),
                            "message": _textController.text
                          });
                          handleSubmitted(_textController.text);
                          _textController.clear();
                          myFocusNode.requestFocus();
                        }
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 1,
                    right: 1.0,
                  ),
                  child: InkWell(
                    child: Icon(
                      Icons.mic,
                      size: 33,
                      color: AppColors.primary,
                    ),
                    onTap: () {
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12.0,
                  ),
                  child: GlowingActionButton(
                    color: AppColors.primary,
                    icon: Icons.send_rounded,
                    onPressed: () {
                      setState(() {
                        if (_textController.text.isNotEmpty) {
                          messages.insert(
                              0,
                              Message(
                                  id: '0',
                                  createdAt: DateTime.now(),
                                  text: _textController.text));
                          newRef.set({
                            "userUID": '0',
                            "time": DateTime.now().toString(),
                            "message": _textController.text
                          });
                          handleSubmitted(_textController.text);
                          _textController.clear();
                          myFocusNode.requestFocus();
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({
    Key? key,
    required this.messages,
  }) : super(key: key);

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: messages.length + 1,
        reverse: true,
        separatorBuilder: (context, index) {
          if (index == messages.length - 1) {
            return _DateLabel(dateTime: messages[index].createdAt);
          }
          if (messages.length == 1) {
            return const SizedBox.shrink();
          } else if (index >= messages.length - 1) {
            return const SizedBox.shrink();
          } else if (index <= messages.length) {
            final message = messages[index];
            final nextMessage = messages[index + 1];
            if (!Jiffy(message.createdAt.toLocal())
                .isSame(nextMessage.createdAt.toLocal(), Units.DAY)) {
              return _DateLabel(
                dateTime: message.createdAt,
              );
            } else {
              return const SizedBox.shrink();
            }
          } else {
            return const SizedBox.shrink();
          }
        },
        itemBuilder: (context, index) {
          if (index < messages.length) {
            final message = messages[index];
            if (message.id == '0') {
              return _MessageOwnTile(message: message);
            } else {
              return _MessageTile(message: message);
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    width: 59,
                    height: 59,
                    child: Stack(children: <Widget>[
                      Positioned(
                          child: Container(
                              width: 59,
                              height: 59,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(138, 136, 209, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(59, 59)),
                              ))),
                      Positioned(
                          top: 8,
                          left: 2,
                          child: Container(
                              width: 55,
                              height: 42,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Manito_small.png'),
                                    fit: BoxFit.fitWidth),
                              ))),
                    ])),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.textFaded,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(_borderRadius),
                      topRight: Radius.circular(_borderRadius),
                      bottomRight: Radius.circular(_borderRadius),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Text(
                      message.text ?? '',
                      style: GoogleFonts.poppins(
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                Jiffy(message.createdAt.toLocal()).jm,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Text(message.text.toString(),
                    style: GoogleFonts.poppins(
                      color: AppColors.textDark,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                Jiffy(message.createdAt.toLocal()).jm,
                style: const TextStyle(
                  color: AppColors.textDark,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DateLabel extends StatefulWidget {
  const _DateLabel({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  final DateTime dateTime;

  @override
  State<_DateLabel> createState() => _DateLabelState();
}

class _DateLabelState extends State<_DateLabel> {
  late String dayInfo;

  @override
  void initState() {
    final createdAt = Jiffy(widget.dateTime);
    final now = DateTime.now();

    if (Jiffy(createdAt).isSame(now, Units.DAY)) {
      dayInfo = 'TODAY';
    } else if (Jiffy(createdAt)
        .isSame(now.subtract(const Duration(days: 1)), Units.DAY)) {
      dayInfo = 'YESTERDAY';
    } else if (Jiffy(createdAt).isAfter(
      now.subtract(const Duration(days: 7)),
      Units.DAY,
    )) {
      dayInfo = createdAt.EEEE;
    } else if (Jiffy(createdAt).isAfter(
      Jiffy(now).subtract(years: 1),
      Units.DAY,
    )) {
      dayInfo = createdAt.MMMd;
    } else {
      dayInfo = createdAt.MMMd;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              dayInfo,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(
          url: messageData.profilePicture,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 2),
              const Text(
                'Online now',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
