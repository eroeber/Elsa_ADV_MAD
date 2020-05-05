package com.example.replyall.data

import com.example.replyall.API_KEY
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Path

interface WordsAPIService {
    @GET("${API_KEY}/{word}/json")
    fun getSynonyms(@Path("word") word: String): Call<SynonymsResponse>
}