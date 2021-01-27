import 'dart:ui';

import 'package:LearningFlutter/cases_view.dart';
import 'package:flutter/material.dart';

class Case{
  CaseStatus status;

  Case(this.status);
}

enum CaseStatus{
  alert, progress, approved, shipped
}

extension CaseStatusExtension on CaseStatus{

  Color get color{
    switch (this){
      case CaseStatus.alert:
        return Colors.red;
      case CaseStatus.progress:
        return Colors.blue;
      case CaseStatus.approved:
        return Colors.green;
      case CaseStatus.shipped:
        return Colors.indigo;
    }
    return Colors.black;
  }

  String get description{
    switch (this){
      case CaseStatus.alert:
        return "Missing Information";
      case CaseStatus.progress:
        return "In Progress";
      case CaseStatus.approved:
        return "Approved";
      case CaseStatus.shipped:
        return "Shipped";
    }
    return "";
  }

  IconData get icon{
    switch (this){
      case CaseStatus.alert:
        return Icons.error;
      case CaseStatus.progress:
        return Icons.pie_chart;
      case CaseStatus.approved:
        return Icons.check_circle;
      case CaseStatus.shipped:
        return Icons.local_shipping;
    }
    return Icons.error;
  }

  String get name{
    switch (this){
      case CaseStatus.alert:
        return "Alerts";
      case CaseStatus.progress:
        return "In Progress";
      case CaseStatus.approved:
        return "Approved";
      case CaseStatus.shipped:
        return "Shipped";
    }
    return "";
  }
}