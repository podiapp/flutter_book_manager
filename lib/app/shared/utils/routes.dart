part of '../utils.dart';

class ProjectRoutes {
  ProjectRoutes._();

  static const String bookModule = "/";
  static String bookPage({bool complete = true, String? id}) =>
      complete ? "/$id" : "/:bookId";
  static const String clientModule = "/clients/";
  static String clientPage({bool complete = true, String? id}) =>
      complete ? "/clients/$id" : "/:clientId";
}
