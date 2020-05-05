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

    val synList = MutableLiveData<HashMap<String, String>>()

    fun getSynonymList(forWords: HashMap<String, String>){
        val responseMap = hashMapOf<String, String>()
        CoroutineScope(Dispatchers.IO).launch {
            if(NetworkHelper.networkConnected(app)){
                for((word, pos) in forWords) {

                    val response = service.getSynonyms(word).execute()
                    val responseBody = response.body()

                    if(responseBody != null){
                        Log.i(LOG_TAG, "hello not null response")
                        if(responseBody.containsKey(pos)) {
                            //got synonyms for the right part of speech
                            //get the list of syn
                            val allSyns = responseBody[pos]
                            //choose the first one
                            responseMap[word] = allSyns?.syn!!.elementAt(0)
                        } else {
                            //can't find synonyms for the desired word and part of speech, just use the user inputted word
                            responseMap[word] = word
                        }

                    } else {
                        Log.e(LOG_TAG,"could not search the word")
                    }
                }
                Log.i(LOG_TAG, responseMap.toString())
                synList.postValue(responseMap)
            }
        }
    }

}