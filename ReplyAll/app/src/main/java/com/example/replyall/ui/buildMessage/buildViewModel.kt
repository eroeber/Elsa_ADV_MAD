package com.example.replyall.ui.buildMessage

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class buildViewModel : ViewModel() {

    private val _text = MutableLiveData<String>().apply {
        value = "This is the build message Fragment"
    }
    val text: LiveData<String> = _text
}