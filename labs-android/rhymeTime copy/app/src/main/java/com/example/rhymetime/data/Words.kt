package com.example.rhymetime.data

import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class SearchResponse(
//    val word: String,
//    val rhymes: Rhymes,
    val results: Set<Words> // umm not sure what to do here ugh
)

@JsonClass(generateAdapter = true)
data class Rhymes(
    val all: Set<String>
)



@JsonClass(generateAdapter = true)
data class Words(
    val word: String?,
    val definitions: Set<Definitions>?,
    val rhymes: Rhymes?
)

@JsonClass(generateAdapter = true)
data class Definitions(
    val definition: String,
    val partOfSpeech: String
)

