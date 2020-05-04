package com.example.replyall.data

import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.Path

interface WordsAPIService {
    @Headers("X-Mashape-Key: b229c19739mshfbbf2bcdf7b5bc3p1908cdjsn4374d1771d6f")
    @GET("words/{word}/synonyms")
    fun getSynonyms(@Path("word") word: String): Call<SynonymsResponse>
}