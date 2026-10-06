/// Поля формы. [apiName] — имя поля в ошибках сервера.
enum AddTripField {
  start('start'),
  end('end'),
  amount('amount'),
  commission('commission');

  const AddTripField(this.apiName);

  final String apiName;
}
