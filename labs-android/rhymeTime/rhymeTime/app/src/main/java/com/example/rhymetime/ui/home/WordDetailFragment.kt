package com.example.rhymetime.ui.home

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.RecyclerView
import com.example.rhymetime.R
import com.google.android.material.bottomnavigation.BottomNavigationView

/**
 * A simple [Fragment] subclass.
 */
class WordDetailFragment : Fragment() {

    private lateinit var sharedHomeViewModel :  SharedHomeViewModel

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        activity?.findViewById<BottomNavigationView>(R.id.nav_view)?.visibility = View.GONE

        val root = inflater.inflate(R.layout.fragment_word_detail, container, false)

        val rhymeListView = root.findViewById<RecyclerView>(R.id.rhymesListRecyclerView)
        val currentWordText = root.findViewById<TextView>(R.id.selectedWordTextView)


        sharedHomeViewModel = ViewModelProvider(requireActivity()).get(SharedHomeViewModel::class.java)

        sharedHomeViewModel.selectedWord.observe(viewLifecycleOwner, Observer {
            Log.i("wordLogging", "selected word: ${it.word}")
            (activity as AppCompatActivity?)?.supportActionBar?.title = it.word
            currentWordText.text = it.word
        })

        sharedHomeViewModel.selectedWord.observe(viewLifecycleOwner, Observer {
            Log.i("wordLogging", "Selected word rhymes: ${it.rhymes}")

            val wordList = mutableListOf<String>()
            for(word in it.rhymes.all){
                wordList.add(word)
            }

            rhymeListView.adapter = RhymesRecyclerAdapter(requireContext(), wordList)

        })

        // Inflate the layout for this fragment
        return root
    }

}
