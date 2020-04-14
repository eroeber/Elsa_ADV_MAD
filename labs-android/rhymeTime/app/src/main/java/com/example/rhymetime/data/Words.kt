package com.example.rhymetime.data

data class Words(
    val word: String,
    val definitions: Set<Definitions>,
    val rhymes: Rhymes
)

data class Definitions(
    val definition: String,
    val partOfSpeech: String
)

data class Rhymes(
    val all: Set<String>
)