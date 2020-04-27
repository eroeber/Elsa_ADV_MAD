package com.example.items

import android.app.Application
import android.util.Log
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.Observer

class TaskViewModel(app: Application) : AndroidViewModel(app){
    private val taskRepo = TaskRepository(app)
    private lateinit var adapter: recyclerAdapter

    val taskList = mutableListOf<ToDoItem>()

    private val taskListObserver = Observer<List<com.example.items.database.ToDoItem>>{
        val allTasks = mutableListOf<ToDoItem>()

        for(task in it){
            allTasks.add(ToDoItem.fromRoomTypes(task))
        }
        taskList.addAll(allTasks)

//        adapter.taskList = taskList
//        adapter.notifyDataSetChanged()
    }

    init{
        taskRepo.taskRoomList.observeForever(taskListObserver)
    }

    override fun onCleared() {
        taskRepo.taskRoomList.removeObserver(taskListObserver)
        super.onCleared()
    }

    // pass new task to repo for conversion and insertion
    fun addTask(task: ToDoItem){
        taskRepo.addTask(task)
    }

    fun removeTask(id: String) = taskRepo.removeTask(id)


}