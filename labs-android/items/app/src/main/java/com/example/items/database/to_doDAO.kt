package com.example.items.database

import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query

@Dao
interface to_doDAO {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    fun insertTask(toDoItem: ToDoItem)

    @Query("SELECT * FROM toDo_table")
    fun getAllTasks(): LiveData<List<ToDoItem>>

    @Query("DELETE FROM toDo_table WHERE task_id = :id")
    fun removeTask(id: Int)
}