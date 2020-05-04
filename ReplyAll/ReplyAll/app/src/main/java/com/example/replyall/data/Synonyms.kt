package com.example.replyall.data

import com.squareup.moshi.JsonClass

//stuff for searching for synonyms
@JsonClass(generateAdapter = true)
data class SynonymsResponse(
    val word: String,
    val synonyms: Synonyms
)

@JsonClass(generateAdapter = true)
data class Synonyms(
    val all: Set<String>
)