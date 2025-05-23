import 'package:ds_tools_testing/ds_tools_testing.dart';
import 'package:transmit_dart_auth_sdk/src/methods/token/aortem_transmit_journey_token.dart';
// Adjust package import as needed

void main() {
  group('processJourneyToken (HTTP Request Approach) Tests', () {
    final transmitJourneyToken = AortemTransmitJourneyToken(
      apiKey: 'valid-api-key',
    );

    test('throws error for empty journey token', () {
      expect(
        () => transmitJourneyToken.processJourneyToken(''),
        throwsA(isA<ArgumentError>()),
      );
    });
  });

  group('processJourneyTokenStub (Stub/Mock Implementation) Tests', () {
    final transmitJourneyToken = AortemTransmitJourneyToken(
      apiKey: 'valid-api-key',
    );
    final journeyToken = 'valid-journey-token';

    test('returns dummy journey token details for a valid token', () async {
      final details = await transmitJourneyToken.processJourneyTokenStub(
        journeyToken,
      );
      expect(details['journeyToken'], equals(journeyToken));
      expect(details.containsKey('expiresIn'), isTrue);
    });

    test('throws error for empty journey token (stub)', () {
      expect(
        () => transmitJourneyToken.processJourneyTokenStub(''),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
