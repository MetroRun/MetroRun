class Routes
{
  static const string qrcodes = QRCodesPage.routeName;
  static const string ticket = TicketPage.routeName;
 }


class QRCodesPage extends StatelessWidget {
  static const String routeName = '/qrcodes';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("QR codes"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("QR codes")));
  }
}

class TicketPage extends StatelessWidget {
  static const String routeName = '/ticket';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Tickets"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Tickets")));
  }
}
