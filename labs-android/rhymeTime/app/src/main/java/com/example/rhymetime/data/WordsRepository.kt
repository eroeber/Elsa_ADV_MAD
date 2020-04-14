package com.example.rhymetime.data

import android.app.Application
import androidx.lifecycle.MutableLiveData
import com.example.rhymetime.utils.FileHelper
import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.Types
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory

class WordsRepository(val app: Application) {

    private val listType = Types.newParameterizedType(List::class.java, Words::class.java)
    val wordData = MutableLiveData<List<Words>>()

    init {
        getWordData()
    }

    private fun getWordData(){
        val dataText = FileHelper.readTextFromAssets(app, "sample-words.json")

        val moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()

        val adapter: JsonAdapter<List<Words>> = moshi.adapter(listType)

        // update live data object
        wordData.value = adapter.fromJson(dataText) ?: emptyList()
    }
}