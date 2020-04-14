package com.example.rhymetime.ui.home

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.rhymetime.data.WordsRepository
import com.example.rhymetime.utils.FileHelper

// this is the portion for searching
class HomeViewModel(app: Application) : AndroidViewModel(app) {

//    init {
//        val text = FileHelper.readTextFromAssets(app, "sample-words.json")
//        Log.i("wordLogging", text)
//    }

    // instantiate repository class
    private val wordRepo = WordsRepository(app)

    // reference to the live data object
    val wordData = wordRepo.wordData

    private val _text = MutableLiveData<String>().apply {
        value = "This is search Fragment"
    }
    val text: LiveData<String> = _text
}