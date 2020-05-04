package com.example.replyall

import android.app.Application
import android.util.Log
import androidx.lifecycle.MutableLiveData
import com.example.replyall.data.SynonymsResponse
import com.example.replyall.data.WordsAPIService
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory

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

    private var retrofit: Retrofit = Retrofit.Builder()
        .baseUrl(BASE_URL)
        .addConverterFactory(MoshiConverterFactory.create())
        .build()
    private var service: WordsAPIService

    init{
        service = retrofit.create(WordsAPIService::class.java)
    }

    private val synList = MutableLiveData<SynonymsResponse>()

    fun getSynonymList(forWord: String){
        Log.i(LOG_TAG, "synonym list")
        CoroutineScope(Dispatchers.IO).launch {
            if(NetworkHelper.networkConnected(app)){
                val response = service.getSynonyms(forWord).execute()
                Log.i(LOG_TAG, "hello response")
                if(response.body() != null){
                    val responseBody = response.body()
                    Log.i(LOG_TAG, "hello not null response")
                    synList.postValue(responseBody)
                    Log.i(LOG_TAG, synList.toString())
                } else {
                    Log.e(LOG_TAG,"could not search the word")
                }
            }
        }
    }

}