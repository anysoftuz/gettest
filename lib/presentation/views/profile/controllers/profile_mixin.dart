part of 'package:gettest/presentation/views/profile/profile_view.dart';

mixin ProfileMixin on State<ProfileView> {
  String? _error;
  MyIdResult? _result;
  final uuid = const Uuid();
  String? myid;

  Future<void> init() async {
    String? error;
    MyIdResult? result;

    final myUuid = uuid.v1();

    try {
      const clientId = 'gettest_sdk-41pLZW0KjpfTeitUPlDwGw6imwqdsjTM8DcQbTup';
      const clientHash =
          'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy9iZGRjDSeW+fpkkGnKX5FQkoPQ/UFWm7MCble6QgdKBqm2LuObbUDIe2cqvDfjuV452o96Evvv2t+ZGBLg5Nw4smelQjLdaBPoYYDD5zmzRRj54VkNGTlJHmmnJgHTt3prA6NWSqjTZo60MZwTvG9S+TFu07UXZuWjvQYqgIYhR4wPgW0CrxxUnIqj9WQSapdgm68FNOLIFNIc11MbeuRzVoTXBs+78bYCOvnyvsNJSD9Tjih7IIcilxF2zSJzDzU/MrLFULwfCtGme6X+4/WKfx9dBTuUEUuIu2XeisC1Dm6LKoNvZQ/1PEKLpXgz/5R8fucK4gIZc9qAt3x/pdwIDAQAB';
      const clientHashId = '1fbf1c85-7338-4334-b5f7-0549f9524ee4';

      final myIdResult = await MyIdClient.start(
        config: MyIdConfig(
          // PROVIDE CLIENT_ID, CLIENT_HASH and CLIENT_HASH_ID. YOU'VE GOT FROM YOUR BACKEND
          clientId: clientId,
          clientHash: clientHash,
          clientHashId: clientHashId,
          buildMode: MyIdBuildMode.DEBUG,
          entryType: MyIdEntryType.AUTH,
          externalId: myUuid,
        ),
        iosAppearance: const MyIdIOSAppearance(),
      );

      error = null;
      result = myIdResult;
      myid = myUuid;
      Log.i(result);
      Log.i(result.base64);
      Log.i(result.code);
      Log.i(result.comparison);
    } catch (e) {
      if (e is PlatformException) {
        Log.e(e.code);
        Log.e(e.details);
        Log.e(e.message);
        Log.e(e.stacktrace);
      }
      error = e.toString();
      result = null;
      myid = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _error = error;
      _result = result;
    });

    if (_result != null && _error == null) {
      context.read<AuthBloc>().add(MyIdVerifyEvent(
            base64: _result!.base64 ?? "",
            comparisonValue: _result!.comparison ?? "",
            authCode: _result!.code ?? '',
            externalId: myid ?? '',
            onError: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Birozdan so'ng qayta urinib ko'ring")));
            },
            onSucces: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Muvafaqyatli ro'yhatdan o'tdingiz"),
              ));
              context.read<AuthBloc>().add(GetMeEvent());
            },
          ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("MyId Sizni topmadi")));
    }
  }
}
