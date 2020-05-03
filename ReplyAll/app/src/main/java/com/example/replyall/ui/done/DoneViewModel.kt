package com.example.replyall.ui.done

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.replyall.MessageRepository
import com.example.replyall.ui.home.HomeViewModel

class DoneViewModel(app: Application) : AndroidViewModel(app) {
    private val msgRepo = MessageRepository(app)

    lateinit var string1: String
    lateinit var string2: String
    lateinit var string3: String
    lateinit var string4: String
}