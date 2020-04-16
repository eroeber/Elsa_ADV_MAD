package com.example.rhymetime.ui.home

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.navigation.NavController
import androidx.navigation.Navigation
import androidx.recyclerview.widget.RecyclerView
import com.example.rhymetime.R
import com.example.rhymetime.data.Words

class HomeFragment : Fragment(), SearchRecyclerAdapter.WordItemListener {

    private lateinit var homeViewModel: SharedHomeViewModel
    private lateinit var recyclerView: RecyclerView
    private lateinit var navController: NavController

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        navController = Navigation.findNavController(requireActivity(), R.id.nav_host_fragment)
        val root = inflater.inflate(R.layout.fragment_home, container, false)
        recyclerView = root.findViewById(R.id.recyclerView)

        homeViewModel = ViewModelProvider(requireActivity()).get(SharedHomeViewModel::class.java)
        homeViewModel.wordData.observe(viewLifecycleOwner, Observer{
            val adapter = SearchRecyclerAdapter(requireContext(), it, this)
            recyclerView.adapter = adapter
        })

        return root
    }

    override fun onWordItemClick(word: Words) {
        Log.i("wordLogging", word.toString())
        homeViewModel.selectedWord.value = word
        navController.navigate(R.id.action_navigation_home_to_wordDetailFragment)
    }
}
