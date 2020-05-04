package com.example.replyall.ui.home

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.replyall.MainItem
import com.example.replyall.MessageRepository

class HomeViewModel(app: Application) : AndroidViewModel(app) {
    val msgRepo = MessageRepository(app)

    var msgSelected = msgRepo.selectedInitial

    // how are you?
    var how1 = "1"
    var how2 = "1"
    var how3 = "1"

    // what are you doing today?
    var doing1 = msgRepo.doing1
    var doing2 = msgRepo.doing2
    var doing3 = msgRepo.doing3
    var doing4 = msgRepo.doing4

    // self care blah blah blah?
    var self1 = msgRepo.self1
    var self2 = msgRepo.self2
    var self3 = msgRepo.self3
    var self4 = msgRepo.self4

    // did you read the news?
    var news1 = msgRepo.news1
    var news2 = msgRepo.news2
    var news3 = msgRepo.news3
    var news4 = msgRepo.news4

    // what's new?
    var what1 = msgRepo.what1
    var what2 = msgRepo.what2
    var what3 = msgRepo.what3
    var what4 = msgRepo.what4
}