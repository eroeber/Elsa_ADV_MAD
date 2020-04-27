package com.example.items

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.to_do_item.view.*
import org.w3c.dom.Text

class recyclerAdapter(var taskList: MutableList<ToDoItem>, val itemListener: MainActivity) : RecyclerView.Adapter<recyclerAdapter.itemViewHolder>() {

    class itemViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView){
        val imageView: ImageView = itemView.findViewById(R.id.item_id)
        val textView: TextView =  itemView.findViewById(R.id.task_textView)
        val dateView: TextView = itemView.findViewById(R.id.textView2)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): itemViewHolder {
        val newItemView = LayoutInflater.from(parent.context).inflate(R.layout.to_do_item, parent, false)

        return itemViewHolder(newItemView)
    }

    override fun getItemCount(): Int {
        return taskList.size
    }

    override fun onBindViewHolder(holder: itemViewHolder, position: Int) {
        val currentItem = taskList[position]

        holder.imageView.setImageResource(currentItem.imageSrc)
        holder.textView.text = currentItem.toDoText
        holder.dateView.text = "Date added: ${currentItem.dateAdded.toString()}"

        holder.itemView.setOnLongClickListener( View.OnLongClickListener{
            itemListener.onTaskLongClick(currentItem)
            return@OnLongClickListener true
        })
    }

}