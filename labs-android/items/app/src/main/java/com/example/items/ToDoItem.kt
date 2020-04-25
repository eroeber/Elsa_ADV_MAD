package com.example.items

import com.example.items.database.ToDoItem
import java.util.*

data class ToDoItem (
    val task_id:  Int,
    val imageSrc: Int,
    val toDoText: String,
    val dateAdded: Date,
    val urgency: Boolean
){
    // method to convert to room types
    fun getRoomTask(): ToDoItem{
        return  ToDoItem(
            task_id,
            imageSrc,
            toDoText,
            Date(),
            urgency
        )
    }

    // convert from room types
    companion object {
        fun fromRoomTypes(task: ToDoItem): com.example.items.ToDoItem{
            return com.example.items.ToDoItem(
                task.task_id,
                task.image_src,
                task.toDoText,
                task.dateAdded,
                task.urgency
            )
        }
    }
}