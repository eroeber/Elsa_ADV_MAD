package com.example.replyall.data

import com.squareup.moshi.JsonClass

//stuff for searching for synonyms
@JsonClass(generateAdapter = true)
data class SynonymsResponse(
    val adjective: Synonyms
)

@JsonClass(generateAdapter = true)
data class Synonyms(
    val syn: Set<String>
)