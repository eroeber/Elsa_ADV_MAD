package com.example.items

import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {
    private lateinit var taskRepo: TaskRepository
    val taskList = MutableList<List<ToDoItem>>()
    // recycler view stuff with database
    private lateinit var taskRecyclerView: RecyclerView
    private lateinit var adapter: recyclerAdapter

    private val taskListObserver = Observer<List<com.example.items.database.ToDoItem>>{
        val allTasks = mutableListOf<ToDoItem>()

        for(task in it){
            allTasks.add(ToDoItem.fromRoomTypes(task))
        }
        taskList.addAll(allTasks)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        taskRepo = TaskRepository(application)
        taskRepo.taskRoomList.observeForever(taskListObserver)


        myTestList(15)
//        task_recycler_view.adapter = recyclerAdapter(testList)
//        task_recycler_view.layoutManager = LinearLayoutManager(this)
//        task_recycler_view.setHasFixedSize(true)

        taskRecyclerView = findViewById(R.id.task_recycler_view)
        adapter = recyclerAdapter(taskList)
        taskRecyclerView.adapter = adapter

//        taskRepo.taskRoomList.observe(LifecycleOwner, Observer {
//            adapter.allTasks  =  it
//            adapter.notifyDataSetChanged()
//        })



        // get reference to button
        val doneButton = findViewById<Button>(R.id.button)
        // set listener
        doneButton.setOnClickListener{
            Toast.makeText(this@MainActivity, "You clicked me.", Toast.LENGTH_SHORT).show()

        }


    }
        // not sure if i need an oncleared function  since i'm doing this in mainActivity and not a VM
//    override fun onCleared(){
//
//    }

    private fun myTestList(size: Int): List<ToDoItem> {
        val list = ArrayList<ToDoItem>()
        for (i in 0 until size){
            val drawable = R.drawable.to_do_icon
            val item = ToDoItem(0, drawable, "task $i", java.util.Date(), false)
            taskRepo.addTask(item)
            list += item
        }
        return list
    }



}
