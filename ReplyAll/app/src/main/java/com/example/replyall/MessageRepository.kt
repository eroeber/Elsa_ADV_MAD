package com.example.replyall

import android.app.Application

class MessageRepository(val app: Application) {
    var selectedInitial = 0

    // how are you?
    var how1: String = ""
    var how2: String = ""
    var how3: String = ""

    // what are you doing today?
    var doing1: String = ""
    var doing2: String  = ""
    var doing3: String  = ""
    var doing4: String  = ""

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