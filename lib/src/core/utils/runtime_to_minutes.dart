String runTimeToMinutes(int value) {
  final hour = value ~/ 60;
  final min = value % 60;
  return '${hour}h ${min}m';
}
