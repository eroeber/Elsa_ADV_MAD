package com.example.rhymetime.ui.home

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.rhymetime.R

class RhymesRecyclerAdapter(val context: Context, val wordList: List<String>): RecyclerView.Adapter<RhymesRecyclerAdapter.ViewHolder>() {

    inner class ViewHolder(itemView: View): RecyclerView.ViewHolder(itemView){
        val rhymeTextView: TextView = itemView.findViewById(R.id.rhymeTextView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        val view = inflater.inflate(R.layout.rhyme_list_item, parent, false)

        return ViewHolder(view)
    }

    override fun getItemCount() = wordList.count()

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val curRhyme = wordList[position]
        holder.rhymeTextView.text = curRhyme
    }

}