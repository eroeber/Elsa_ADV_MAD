package com.example.rhymetime.utils

import android.content.Context

class FileHelper {
    companion object{
        fun readTextFromAssets(context: Context, filename: String): String{
            return context.assets.open(filename).use{ inputStream ->
                inputStream.bufferedReader().use{
                    it.readText()
                }
            }
        }
    }
}