package com.example.replyall.ui.home

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.replyall.MainItem
import com.example.replyall.R
import kotlinx.android.synthetic.main.main_message.view.*

class MainRecyclerAdapter(private val messageList: List<MainItem>, val itemListener: MessageItemListener) : RecyclerView.Adapter<MainRecyclerAdapter.MainViewHolder>() {

    class MainViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val messageText: TextView = itemView.message_text
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MainViewHolder {
        val itemView = LayoutInflater.from(parent.context).inflate(
            R.layout.main_message,
            parent, false)

        return MainViewHolder(
            itemView
        )
    }

    override fun getItemCount() = messageList.size

    override fun onBindViewHolder(holder: MainViewHolder, position: Int) {
        val currentItem = messageList[position]
        holder.messageText.text = currentItem.messageText
        holder.itemView.setOnClickListener{
            itemListener.onMessageItemClick(currentItem)
        }
    }

    interface MessageItemListener{
        fun onMessageItemClick(mainItem: MainItem)
    }
}