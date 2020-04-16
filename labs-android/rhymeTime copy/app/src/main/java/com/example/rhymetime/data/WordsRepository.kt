package com.example.rhymetime.data

import android.app.Application
import android.util.Log
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import com.example.rhymetime.utils.BASE_URL
import com.example.rhymetime.utils.FileHelper
import com.example.rhymetime.utils.LOG_TAG
import com.example.rhymetime.utils.NetworkHelper
import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.Types
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory

class WordsRepository(val app: Application) {

    private val listType = Types.newParameterizedType(List::class.java, Words::class.java)

    private var retrofit: Retrofit = Retrofit.Builder()
        .baseUrl(BASE_URL)
        .addConverterFactory(MoshiConverterFactory.create())
        .build()
//    private var service: WordsAPIService

//    init{
//        service = retrofit.create(WordsAPIService::class.java)
//        CoroutineScope(Dispatchers.IO).launch{
//            getWordList()
//        }
//    }

//    val searchTermEntered = Observer<String>{
//        CoroutineScope(Dispatchers.IO).launch{
//            getWordData(it)
//        }
//
//    }

    val wordData = MutableLiveData<List<Words>>()

    val words = MutableLiveData<List<Words>>()

    val wordSelectedObserver = Observer<Words>{
        getWordDetails(it)
    }

    init {
        getWordData()
    //    getWordList()
    }

    private fun getWordData(){
        val dataText = FileHelper.readTextFromAssets(app, "sample-words.json")

        val moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()

        val adapter: JsonAdapter<List<Words>> = moshi.adapter(listType)

        // update live data object
        wordData.value = adapter.fromJson(dataText) ?: emptyList()
    }

    // load a sample word tapped
    private fun getWordDetails(forWords: Words){
        val detailsText = FileHelper.readTextFromAssets(app, "sample-words.json")

        val moshi = Moshi.Builder().add(KotlinJsonAdapterFactory()).build()
        // is this the right class referenced?
        val adapter: JsonAdapter<List<Words>> = moshi.adapter(listType)

        // update live data object
        words.value = adapter.fromJson(detailsText) ?: emptyList()
    }

//    private suspend fun getWordList(){
//        Log.i(LOG_TAG, "hi word list")
//        if(NetworkHelper.networkConnected(app)){
//            val response = service.searchWord("second").execute()
//            if(response.body() != null){
//                Log.i(LOG_TAG, "above response body")
//                val responseBody = response.body()
//                Log.i(LOG_TAG, response.body().toString())
//                wordData.postValue(responseBody?.results?.toList())
//            } else {
//                Log.e(LOG_TAG,"could not search the word")
//            }
//        }
//    }
}