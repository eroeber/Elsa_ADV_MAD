package com.example.items

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel

class TaskViewModel(app: Application) : AndroidViewModel(app){
    private val taskRepo = TaskRepository(app)
    val taskList = taskRepo.allTasks

    fun addTask(task:ToDoItem){
//        Log.i("TASK ADDING:", "adding task ${task}")

        taskRepo.addTask(task)
    }


}