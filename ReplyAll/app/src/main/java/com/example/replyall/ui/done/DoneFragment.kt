package com.example.replyall.ui.done

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import com.example.replyall.R
import com.example.replyall.ui.home.HomeViewModel

class DoneFragment : Fragment() {

    lateinit var homeViewModel: HomeViewModel
    lateinit var finalText: TextView

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        homeViewModel = ViewModelProvider(requireActivity()).get(HomeViewModel::class.java)

        val root = inflater.inflate(R.layout.fragment_done, container, false)
        finalText = root.findViewById(R.id.finalMessage)

        if(homeViewModel.msgSelected == 1){

            finalText.text = "Pretty adjective, things are just ${homeViewModel.how1}. I’m a little " +
                    "bummed about ${homeViewModel.how2} today though. But one highlight " +
                    "${homeViewModel.how3}, which is cool!"
        } else if(homeViewModel.msgSelected == 2){
            finalText.text = "I’ll probably ${homeViewModel.doing1} for a while, then take some time to ${homeViewModel.doing2} my " +
                    "${homeViewModel.doing3}. Turns out my schedule has been pretty ${homeViewModel.doing4}."
        } else if(homeViewModel.msgSelected == 3){
            finalText.text = "I’ve been doing a lot of ${homeViewModel.self1} which makes me feel ${homeViewModel.self2}. My goal " +
                    "is to be better at ${homeViewModel.self3} by the time this is over. But honestly " +
                    "I really just like to ${homeViewModel.self4} to relax."
        } else if(homeViewModel.msgSelected == 4){
            finalText.text = "${homeViewModel.news1}, I decided to ${homeViewModel.news2} the news." +
                    " At this point I try and ${homeViewModel.news3} " +
                    "the news because it makes me feel ${homeViewModel.news4} whenever I read them."
        } else {
            finalText.text = "My biggest update is ${homeViewModel.what1}. " +
                    "Not a whole lot is changing, just sticking to my ${homeViewModel.what2} daily " +
                    "routine. How about you? Anything ${homeViewModel.what3} "  + "${homeViewModel.what4}" +
                    " happen since we last chatted?"
        }

        return root
    }
}
