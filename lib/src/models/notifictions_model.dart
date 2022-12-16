class Notification {
  dynamic id;
  dynamic title;
  dynamic subtitle;
  Notification({this.id, this.title, this.subtitle});
}

class NotificationCategory {
  NotificationCategory({
    required this.category,
    required this.notifications,
  });
  final String category;
  final List<Notification> notifications;
}

final notifications = [
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
  Notification(
      id: 1, title: 'Notificacion 1', subtitle: 'Esto es una prueba XD'),
];
