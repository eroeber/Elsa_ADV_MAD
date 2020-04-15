package com.example.rhymetime.data

import com.squareup.moshi.JsonClass

@JsonClass(generateAdapter = true)
data class SearchResponse(
    val results: Set<Words>,
    val number: Int,
    val totalResults: Int
)

@JsonClass(generateAdapter = true)
data class Words(
    val word: String,
    val definitions: Set<Definitions>,
    val rhymes: Rhymes
)

@JsonClass(generateAdapter = true)
data class Definitions(
    val definition: String,
    val partOfSpeech: String
)

@JsonClass(generateAdapter = true)
data class Rhymes(
    val all: Set<String>
)