import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/exception/firebase_data_exception.dart';
import 'package:todo/core/exception/timeout_firebase_exception.dart';

import '../model/task_modle.dart';
import '../model/user_model.dart';

class FirebaseFunction {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference<TaskModel> mainTaskFunction() {
    return firestore.collection("Tasks").withConverter(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> mainUserFunction() {
    return firestore.collection("User").withConverter(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUser(UserModel user) async {
    var ref = mainUserFunction();
    await ref.doc(user.id).set(user);
  }

  static Future<void> addTask(TaskModel task) async {
    var ref = mainTaskFunction();
    var docRef = ref.doc();
    task.id = docRef.id;
    task.userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return docRef.set(task);
  }

  static Future<UserModel?> getUser() async {
    var userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    var ref = mainUserFunction();
    var docRef = await ref.doc(userId).get();
    return docRef.data();
  }

  static isDone(TaskModel task) async {
    var ref = mainTaskFunction();
    var docRef = ref.doc(task.id);
    return docRef.update({
      "isDone": !task.isDone,
    });
  }

  static Stream<QuerySnapshot<TaskModel?>> getTask(int time) {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    var ref = mainTaskFunction();
    var date =  ref
        .where("date", isEqualTo: time)
        .where("userId", isEqualTo: userId)
        .snapshots();
    return date;
  }

  static deleteTask(String id) async {
    var ref = mainTaskFunction();
    await ref.doc(id).delete();
  }

  static createAccount(
      String email, String password, String name, String phone) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUser(UserModel(
          id: credential.user?.uid ?? "",
          name: name,
          email: email,
          phone: phone));
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<UserCredential> loginAccount(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw 'Error: ${e.message}';
    } catch (e) {
      throw 'An unexpected error occurred: ${e.toString()}';
    }
  }

  static updateTask(TaskModel task) async {
    try {
      await mainTaskFunction()
          .doc(task.id)
          .update(task.toJson())
          .timeout(const Duration(seconds: 60));
    } on FirebaseException catch (e) {
      throw FirebaseDataException(e.message ?? "Firebase Error");
    } on TimeoutException {
      throw TimeoutFirebaseException("Time Out Exception");
    } catch (e) {
      return e.toString();
    }
  }
}
