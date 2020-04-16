package com.example.rhymetime.ui.home

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.example.rhymetime.data.Words
import com.example.rhymetime.data.WordsRepository
import com.example.rhymetime.utils.FileHelper

// this is the portion for searching
class SharedHomeViewModel(app: Application) : AndroidViewModel(app) {

    // instantiate repository class
    private val wordRepo = WordsRepository(app)

    // reference to the live data object
    val wordData = wordRepo.wordData

    // store selected word
    val selectedWord = MutableLiveData<Words>()

    val wordDetails = wordRepo.words

    init{
        selectedWord.observeForever(wordRepo.wordSelectedObserver)
    }

    override fun onCleared() {
        selectedWord.removeObserver(wordRepo.wordSelectedObserver)
        super.onCleared()
    }
}