package com.example.items

import android.app.Application
import android.content.Context
import androidx.room.*
import com.example.items.database.ToDoItem
import com.example.items.database.to_doDAO

@Database(entities = [ToDoItem::class],
    version =  2,
    exportSchema = false)
@TypeConverters(Converters::class)
abstract class AppDatabase: RoomDatabase() {
    abstract fun to_doDAO(): to_doDAO

    companion object{
        var INSTANCE: AppDatabase? = null

        // get reference to database or create
        fun getDatabase(context: Context): AppDatabase {
            val tempInstance = INSTANCE
            // return instance if it exists
            if(tempInstance!= null) return tempInstance

            // create instance if it does not exist
            synchronized(this){
                val instance = Room.databaseBuilder(context.applicationContext, AppDatabase::class.java, "task_database")
                    .fallbackToDestructiveMigration()
                    .build()

                INSTANCE = instance
                return instance
            }
        }
    }
}