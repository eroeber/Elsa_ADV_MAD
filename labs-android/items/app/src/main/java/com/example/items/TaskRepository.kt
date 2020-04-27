package com.example.items

import android.app.Application
import android.util.Log
import androidx.lifecycle.LiveData
import com.example.items.database.ToDoItem
import com.example.items.database.to_doDAO
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.launch

class TaskRepository(val app: Application) {
    private val db = AppDatabase.getDatabase(app)

    // dao reference
    private val toDoDAO = db.to_doDAO()

    // get live data object of all tasks
     val allTasks: LiveData<List<ToDoItem>> = toDoDAO.getAllTasks()

    val  taskRoomList: LiveData<List<ToDoItem>> = toDoDAO.getAllTasks()

    fun addTask(task: com.example.items.ToDoItem){
        CoroutineScope(Dispatchers.IO).launch {
            toDoDAO.insertTask(task.getRoomTask())
            Log.i("TASK ADDING:", "adding task ${task}")

        }
    }

    fun removeTask(id: String){
        CoroutineScope(Dispatchers.IO).async{
            toDoDAO.removeTask(id)
        }
    }
}