library flutter_chatgpt_api;

import 'dart:io';

import 'package:flutter_chatgpt_api/src/models/models.dart';
import 'package:flutter_chatgpt_api/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

// part 'src/models/chat_message.model.dart';

class ChatGPTApi {
  String sessionToken;
  String clearanceToken;
  String? apiBaseUrl;
  String backendApiBaseUrl;
  String userAgent;

  final ExpiryMap<String, String> _accessTokenCache =
      ExpiryMap<String, String>();

  ChatGPTApi({
    required this.sessionToken,
    required this.clearanceToken,
    this.apiBaseUrl = 'https://chat.openai.com/api',
    this.backendApiBaseUrl = 'https://chat.openai.com/backend-api',
    this.userAgent = "defaultUserAgent",
  });

  Map<String, String> defaultHeaders = {
    'user-agent':
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36",
    'x-openai-assistant-app-id': '',
    'accept-language': 'en-US,en;q=0.9',
    HttpHeaders.accessControlAllowOriginHeader: 'https://chat.openai.com',
    HttpHeaders.refererHeader: 'https://chat.openai.com/chat',
    'sec-ch-ua':
        '"Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"',
    'sec-ch-ua-platform': '"Windows"',
    'sec-fetch-dest': 'empty',
    'sec-fetch-mode': 'cors',
    'sec-fetch-site': 'same-origin',
  };

  Future<ChatResponse> sendMessage(
    String message, {
    String? conversationId,
    String? parentMessageId,
  }) async {
    const accessToken =
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1UaEVOVUpHTkVNMVFURTRNMEZCTWpkQ05UZzVNRFUxUlRVd1FVSkRNRU13UmtGRVFrRXpSZyJ9.eyJodHRwczovL2FwaS5vcGVuYWkuY29tL3Byb2ZpbGUiOnsiZW1haWwiOiJ1c2FyYW13YXNpOTlAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImdlb2lwX2NvdW50cnkiOiJJTiJ9LCJodHRwczovL2FwaS5vcGVuYWkuY29tL2F1dGgiOnsidXNlcl9pZCI6InVzZXItcWRudHl4dDNVSnNWZHNlRHBKSFRDbjNJIn0sImlzcyI6Imh0dHBzOi8vYXV0aDAub3BlbmFpLmNvbS8iLCJzdWIiOiJnb29nbGUtb2F1dGgyfDEwMTE5MDc3NDYxODU2MTY5NjgwMyIsImF1ZCI6WyJodHRwczovL2FwaS5vcGVuYWkuY29tL3YxIiwiaHR0cHM6Ly9vcGVuYWkuYXV0aDAuY29tL3VzZXJpbmZvIl0sImlhdCI6MTY3MTI3NjI4MSwiZXhwIjoxNjcxODgxMDgxLCJhenAiOiJUZEpJY2JlMTZXb1RIdE45NW55eXdoNUU0eU9vNkl0RyIsInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZW1haWwgbW9kZWwucmVhZCBtb2RlbC5yZXF1ZXN0IG9yZ2FuaXphdGlvbi5yZWFkIG9mZmxpbmVfYWNjZXNzIn0.JxNSzzKyqJW-TfetwwXMS6S4EQ93z6PQart6vKVvNY2fjTzl4S0BX-J39druwK8XPeAqFx64b3bngLg084UwvzrYqWoF-ybZeWnP3C6xUSVKfY_OpwYysAabkH6R-wM4dRlfIMGjoFFR4EUDTuXd0aRM1pNo4aLxd3d_VN8YJb0h9DhlBoDX-HwNZY8-qqQQBIvAacWizEKUN5S78hk7LwjWI4UalLvx2sYflxgmvce4CPYNY7ZTIEsqcqAc44cUVxN99rhIxiQLJmH8W5dZ4E_ZsqXrRYeIg0gCJsjtYX-n9AHoFt1Q229_I0b6T8x_qqT0BA8f_4zYJtrnvHLx2A";
    parentMessageId ??= const Uuid().v4();

    final body = ConversationBody(
      action: 'next',
      conversationId: "cfb31d26-feae-48a9-afe5-5c1242212b4a",
      messages: [
        Prompt(
          content: PromptContent(contentType: 'text', parts: [message]),
          id: const Uuid().v4(),
          role: 'user',
        )
      ],
      model: 'text-davinci-002-render',
      parentMessageId: "ce0b7752-f238-4095-a693-5a1160ecf587",
    );

    final url = '$backendApiBaseUrl/conversation';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'user-agent': defaultUserAgent,
        'x-openai-assistant-app-id': '',
        'accept-language': 'en-US,en;q=0.9',
        HttpHeaders.accessControlAllowOriginHeader: 'https://chat.openai.com',
        HttpHeaders.refererHeader: 'https://chat.openai.com/chat',
        'sec-ch-ua':
            '"Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"',
        'sec-ch-ua-platform': '"Windows"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-origin',
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
        'Accept': 'text/event-stream',
        'Cookie': 'cf_clearance=$clearanceToken'
      },
      body: body.toJson(),
    );

    print(response);
    if (response.statusCode != 200) {
      if (response.statusCode == 429) {
        throw Exception('Rate limited');
      } else {
        throw Exception('Failed to send message $body[conversationId]');
      }
    } else if (_errorMessages.contains(response.body)) {
      throw Exception('OpenAI returned an error');
    }

    String longestLine =
        response.body.split('\n').reduce((a, b) => a.length > b.length ? a : b);

    var result = longestLine.replaceFirst('data: ', '');

    var messageResult = ConversationResponseEvent.fromJson(result);

    var lastResult = messageResult.message?.content.parts.first;

    if (lastResult == null) {
      throw Exception('No response from OpenAI');
    } else {
      return ChatResponse(
        message: lastResult,
        messageId: messageResult.message!.id,
        conversationId: messageResult.conversationId,
      );
    }
  }

//   Future<String> _refreshAccessToken() async {
//     final cachedAccessToken = _accessTokenCache['KEY_ACCESS_TOKEN'];
//     if (cachedAccessToken != null) {
//       return cachedAccessToken;
//     }

//     try {
//       final res = await http.get(
//         Uri.parse('$apiBaseUrl/auth/session'),
//         headers: {
//           'cookie':
//               'cf_clearance=$clearanceToken;__Secure-next-auth.session-token=$sessionToken',
//           'accept': '*/*',
//           ...defaultHeaders,
//         },
//       );

//       if (res.statusCode != 200) {
//         throw Exception('Failed to refresh access token');
//       }

//       final accessToken = jsonDecode(res.body)['accessToken'];

//       if (accessToken == null) {
//         throw Exception(
//             'Failed to refresh access token, token in response is null');
//       }

//       _accessTokenCache['KEY_ACCESS_TOKEN'] = accessToken;
//       return accessToken;
//     } catch (err) {
//       throw Exception('ChatGPT failed to refresh auth token: $err');
//     }
//   }
// }

  final defaultUserAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36';

  final _errorMessages = [
    "{\"detail\":\"Hmm...something seems to have gone wrong. Maybe try me again in a little bit.\"}",
  ];
}

enum ChatMessageType { user, bot }

class ChatMessage {
  ChatMessage({
    required this.text,
    required this.chatMessageType,
  });

  final String text;
  final ChatMessageType chatMessageType;
}
