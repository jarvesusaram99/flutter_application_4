import 'package:flutter/material.dart';
import 'package:flutter_application_4/gpt.dart';

class ChatGpt extends StatefulWidget {
  const ChatGpt({super.key});

  @override
  State<ChatGpt> createState() => _ChatGptState();
}

class _ChatGptState extends State<ChatGpt> {
  var api = ChatGPTApi(
      sessionToken:
          "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..mTKwpgskj_V8px6H.hshTnEljHAGVLZ6-pNadqnui3w5XCsBPFvwOs25ToRGFwtp-V6sjWasVAUK0gTif0V9VmHOnQqEG5jCuNYOUaJQSKHCh39D_3l5pWNTbwI_hwfqpBDTP6EotLu525VM3Pbdg5sbFbJCeq3ojUZoruAeyB_RpGxHLBcx3lqOCoI-vznvcIqi76CYPB9Avy9p7UrSbrmbLecaWusAiKc-O8ddue_1dYr6NH3iaesjIW-SlDSzH8BHehPcqLTuP_2GkO4gvpkQagMsLnkbH57aKB2RPf7OS4QSzs0BxBJ-gBPD_iw0wRBE7DXbP3Hvx2j4iZbTvZZdUV-EfRZe7O3PfD-UXNVyUwCiBEfh-q01J6RF-2FNbabxNQKU4qDb3UwyyJjMmRNZ_QWJ6eTpzjRG7ASbXNQcOXA409QpwXJbCYfsbUnK7GPejEP_U7_GL0DqvWzXj-4Zt0K7oK4wdBvQTCIP__92IRXGlvijRpeXfJPPG6RFVBX7pNWSdFrd5s9AUFsbCVweiOtlMDE-gsTiYea5BS76Emew4EBKkSX42MGpQF5HuZu_JdLZuc5XLpLecbyWjXG2WokXQGums2K_XHuMJByKJtyzRGTAFaWj6D3A4QrgRw6gK9NhWxyWkGR5-zIm4F1LjP237dmJmQvrauCI737jbyWvQaO9p3JFdHK-KBaKmPz5A-tdfi-rdLLQmHMs9dkbA-P2xfIWbRfuFjzRl6rDXRswo17Qxuq9-seiu4UQhN_PtQbWD33wzIa7fje4Wvob4dq-eXUd6VHMqTOiLHnHpREbLLiewm2ss23TkHgxYaWLSKucBInrSY_JNdHAyUPuTi0qTWEyooYA0yVgk_6tuI85sx-o3Q7R8Q1Ng8m9zWEJmv85po0F02JK2zWNhsW9-mpNQcc6_mIE-MowWeDvrYQqekbxCCribrBO0sL7h1j9gTU2N2vK5AZb2UC3SBdyieLdqxizK2oAWGvv4GKI7WBdB54a5WpmsC3y9Cw6B_E29PcrkGx3FOkJt6mMnTl6Qq-j9eBvTC9ah1fXzEXuLXNTEg4uSM3940aP_kU4zSfjy59o0y8jISw5GvVblwGSR0g9jcNQqFnVPArcydLjZkWFngxkD_4xPsRMkWKfukIsjDtSFJGzCkjy7yHivw_pQ-AkwwLgn_m0jDQ4wM4lXglnHjEQ38HcWnFoGH-Kke43HOhEoMnZG3Ft8qFSETPxCaT979Vk80idou4pcwQGd_YBamne0edm5fADb8NrtqozPBJSItMhFnhvKdMeRBD9n1jRbhtAIpl0MO-Zu-b75boH-duafIyNollzzPQYkE_z36knvVdInTDRpIHQaZIf2nnvoFJtlpbT4va_X1ASoNpVz5qn5DejFg4t7KPrn-nlvGY5rWIp3RLRdUky-2MmaFULwRbHy0AbwbCKzC3ieqEey377vRYq2NfmC72LOOY7Jc6b8qaeBbRfTtRaVSap7NU3tIhMMRouI3Ba1jVS3tFYAIUvabHt4vDCQP3SsllDZVPK6ORQoElojRpDwLnfnnWPAEPquae75VBhOkDQxFvPitqF_nXk0UnVimduL-Xv35XE79wo2jT0oVToflZ97hU61KD_6UqJsYCLkrV304Dw04zxjbGmwpJgf9IeELozxxRM1rtTW-sKLVHm5oMpfqYJi799xybs7wbGp6zDsffZpiDkMTphN09HC4If2HzBQuXUMenQC-G1PnmIl37xi2owrzokQUnoTLi1yxj3CQC60vK1o2xFyyK-AFVfH0sP-T0KTkJ2-Kl_1Tw_ffewyKBMQx3fdDMIi0YrKQ9H6NmaY9kCf52IJwFnNFD946TBAQ7XQA7b4m6Y3s9DJXrD9gsUlvg1axwIpeIDw4xBmQzutCICCHvaE-23OGuSGmuJsOeurfDDFMeqRprz95AI9j6Ry90GSBRJUk7XBVOPuga2waSixG7XhrrVHoWBM7ccrV97V4xz3r4SNXj8WPN9PL47cojNULkEsyVgShKSaZuGyannQgpZjMxlLsC6rDVYG4v92LCByqZBTC6GS5AGG4aSsDokd5EvZGOsYf5nUeHo6GgiwMG-qI0pZtoaTtJ5dJHAr3L1JhC7Jkv2Xh-OA94MkbkSdqY2ZscIgucW9BXTAsu2gbWoX3yIiMB3OFrIhiBG7kKKeQb-rkYI5rBUj8AI24NsRKij8kfe8JpoZ4JvXivTHH-Mnc0mJ5toaKSjQfltoiWPOzglC8axH875wxLuHZyUvhP358lTC_fCX.XN87SYT2b7fKTbRM3JkFDQ",
      clearanceToken:
          '42gCiQVNBf62uSP1bZnLp8qsdDEaaUKAz6TVhWbstIk-1671609237-0-1-bdf6277.d564f4f6.b6759941-160');
  List messages = [];

  // final controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setBackgroundColor(const Color(0x00000000))
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith('https://www.youtube.com/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse('https://chat.openai.com/'));

  @override
  void initState() {
// setState(() {
//   _conversationId = newMessage.conversationId;
//   _parentMessageId = newMessage.messageId;
//   isLoading = false;
//   _messages.add(
//     ChatMessage(
//       text: newMessage.message,
//       chatMessageType: ChatMessageType.bot,
//     ),
//   );
// });
    fun();
    super.initState();
  }

  fun() async {
    setState(() {
      // messages.add(
      //   ChatMessage(
      //     text: ".text",
      //     chatMessageType: ChatMessageType.user,
      //   ),
      // );
      // isLoading = true;
    });

    var newMessage = await api.sendMessage(
      "hi i am jarves",
    );
    print(newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat GPT'),
        ),
        body: Container(
          child: Text(messages.first),
        ));
  }
}
