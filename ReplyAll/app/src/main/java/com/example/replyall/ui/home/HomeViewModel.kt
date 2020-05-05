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
    var how1 = ""
    var how2 = ""
    var how3 = ""

    // what are you doing today?
    var doing1 = ""
    var doing2 = ""
    var doing3 = ""
    var doing4 = ""

    // self care blah blah blah?
    var self1 = ""
    var self2 = ""
    var self3 = ""
    var self4 = ""

    // did you read the news?
    var news1 = ""
    var news2 = ""
    var news3 = ""
    var news4 = ""

    // what's new?
    var what1 = ""
    var what2 = ""
    var what3 = ""
    var what4 = ""
}