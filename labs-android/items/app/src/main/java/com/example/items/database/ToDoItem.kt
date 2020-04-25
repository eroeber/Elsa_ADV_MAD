package com.example.items.database

import androidx.room.Entity
import androidx.room.PrimaryKey
import java.util.*

@Entity(tableName = "toDo_table")

data class ToDoItem(
    @PrimaryKey(autoGenerate = true) val task_id: Int =  0,
    val image_src: Int,
    val toDoText: String,
    val dateAdded: Date,
    val urgency: Boolean
)