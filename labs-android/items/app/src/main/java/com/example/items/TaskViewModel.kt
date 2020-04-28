package com.example.items

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.Observer
import com.example.items.database.ToDoItem

class TaskViewModel(app: Application) : AndroidViewModel(app){
    private val taskRepo = TaskRepository(app)
    val taskList = taskRepo.taskRoomList


    // pass new task to repo for conversion and insertion
    fun addTask(task: ToDoItem){
        taskRepo.addTask(task)
    }

    fun removeTask(id: Int) = taskRepo.removeTask(id)


}