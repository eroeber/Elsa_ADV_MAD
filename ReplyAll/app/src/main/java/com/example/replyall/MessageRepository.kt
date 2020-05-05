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
                val response = service.getSynonyms("bad").execute()
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