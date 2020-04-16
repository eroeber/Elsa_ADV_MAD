package com.example.rhymetime.ui.home

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.rhymetime.R
import com.example.rhymetime.data.Words

// custom adapter
class SearchRecyclerAdapter(val context: Context, val wordList: List<Words>, val itemListener: WordItemListener) : RecyclerView.Adapter<SearchRecyclerAdapter.ViewHolder>() {
    // custom view holder
    inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView){
        val titleText = itemView.findViewById<TextView>(R.id.title)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        val view = inflater.inflate(R.layout.word_list_item, parent, false)

        return ViewHolder(view)
    }

    override fun getItemCount(): Int = wordList.count()

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val curWord = wordList[position]
        holder.titleText.text = curWord.word

        holder.itemView.setOnClickListener {
            itemListener.onWordItemClick(curWord)
        }
    }

    interface WordItemListener{
        fun onWordItemClick(word: Words)
    }
}