package com.example.items

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.RecyclerView


class MainActivity : AppCompatActivity() {
    private lateinit var taskVM: TaskViewModel
    // recycler view stuff with database
    private lateinit var taskRecyclerView: RecyclerView
    private lateinit var adapter: recyclerAdapter

    var taskText: String  = ""



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        taskVM = ViewModelProvider(this).get(TaskViewModel::class.java)


        // user input stuff
        val editText = findViewById<EditText>(R.id.editText)

        taskRecyclerView = findViewById(R.id.task_recycler_view)
        adapter = recyclerAdapter(taskVM.taskList, this)
        taskRecyclerView.adapter = adapter



        // get reference to button
        val doneButton = findViewById<Button>(R.id.button)
        // set listener
        doneButton.setOnClickListener{
            taskText = editText.text.toString()


            myTestList()

            adapter.taskList = taskVM.taskList
            //adapter.notifyDataSetChanged()

        }

    }

    private fun myTestList(){
        val drawable = R.drawable.to_do_icon
        val item = ToDoItem(0, drawable, taskText, java.util.Date(), false)
        taskVM.addTask(item)

    }

    fun onTaskLongClick(task: ToDoItem){
        val dialogBuilder = AlertDialog.Builder(this)
        dialogBuilder.setMessage("Mark this task as done?")
            .setCancelable(false)
            // positive button and action
            .setPositiveButton("YES"){dialog, which ->
                taskVM.removeTask(task.toDoText)

                adapter.taskList = taskVM.taskList
                adapter.notifyDataSetChanged()

                Toast.makeText(this,"Task removed from to-dos!", Toast.LENGTH_SHORT).show()
                dialog.dismiss()
            }
            // negative button and action
            .setNegativeButton("NO") {
                    dialog, _ -> dialog.cancel()
            }
        val alert = dialogBuilder.create()
        alert.setTitle("Task Complete")
        alert.show()

    }

}
