package com.example.replyall.ui.buildMessage

import android.os.Bundle
import android.text.Layout
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.MediaController
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import androidx.navigation.NavController
import androidx.navigation.Navigation
import com.example.replyall.LOG_TAG
import com.example.replyall.MainItem
import com.example.replyall.MessageRepository
import com.example.replyall.R

import com.example.replyall.ui.home.HomeFragment
import com.example.replyall.ui.home.HomeViewModel
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.fragment_self_care.*

class buildFragment : Fragment() {


    lateinit var homeViewModel: HomeViewModel

    private lateinit var navController: NavController
    private lateinit var button: Button
    private lateinit var edit1: EditText
    private lateinit var edit2: EditText
    private lateinit var edit3: EditText
    private lateinit var edit4: EditText

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        navController = Navigation.findNavController(requireActivity(), R.id.nav_host_fragment)
        homeViewModel = ViewModelProvider(requireActivity()).get(HomeViewModel::class.java)



        return if(homeViewModel.msgSelected == 1){
            val root = inflater.inflate(R.layout.fragment_how, container, false)
            button = root.findViewById(R.id.button)

            edit1 = root.findViewById(R.id.how_adj_1)
            edit2 = root.findViewById(R.id.how_adj_2)
            edit3 = root.findViewById(R.id.how_detail_1)

            button.setOnClickListener{
                homeViewModel.how1 = edit1.text.toString()
                homeViewModel.how2 = edit2.text.toString()
                homeViewModel.how3 = edit3.text.toString()

                //construct map with the following structure (User's word, desired part of speech)
                val inputMap = hashMapOf<String, String>()
                inputMap[homeViewModel.how1] = "adjective"
                inputMap[homeViewModel.how2] = "adjective"
                homeViewModel.msgRepo.getSynonymList(inputMap)

                navController.navigate(R.id.action_build_message_to_navigation_done)
            }
            root
        } else if(homeViewModel.msgSelected == 2){
            val root = inflater.inflate(R.layout.fragment_doing, container, false)
            button = root.findViewById(R.id.button)

            edit1 = root.findViewById(R.id.doing_verb_1)
            edit2 = root.findViewById(R.id.doing_verb_2)
            edit3 = root.findViewById(R.id.doing_pn_1)
            edit4 = root.findViewById(R.id.doing_adj_1)

            button.setOnClickListener{
                homeViewModel.doing1 = edit1.text.toString()
                homeViewModel.doing2 = edit2.text.toString()
                homeViewModel.doing3 = edit3.text.toString()
                homeViewModel.doing4 = edit4.text.toString()

                val inputMap = hashMapOf<String, String>()
                inputMap[homeViewModel.doing1] = "verb"
                inputMap[homeViewModel.doing2] = "verb"
                inputMap[homeViewModel.doing4] = "adjective"
                homeViewModel.msgRepo.getSynonymList(inputMap)

                navController.navigate(R.id.action_build_message_to_navigation_done)
            }
            root
        } else if(homeViewModel.msgSelected == 3){
            val root = inflater.inflate(R.layout.fragment_self_care, container, false)
            button = root.findViewById(R.id.button)

            edit1 = root.findViewById(R.id.self_verb_1)
            edit2 = root.findViewById(R.id.self_adj_1)
            edit3 = root.findViewById(R.id.self_activity_1)
            edit4 = root.findViewById(R.id.self_verb_2)

            button.setOnClickListener{
                homeViewModel.self1 = edit1.text.toString()
                homeViewModel.self2 = edit2.text.toString()
                homeViewModel.self3 = edit3.text.toString()
                homeViewModel.self4 = edit4.text.toString()

                val inputMap = hashMapOf<String, String>()
                inputMap[homeViewModel.self1] = "verb"
                inputMap[homeViewModel.self2] = "adjective"
                inputMap[homeViewModel.self4] = "verb"
                homeViewModel.msgRepo.getSynonymList(inputMap)

                navController.navigate(R.id.action_build_message_to_navigation_done)
            }
            root
        } else if(homeViewModel.msgSelected == 4){
            val root = inflater.inflate(R.layout.fragment_news, container, false)
            button = root.findViewById(R.id.button)

            edit1 = root.findViewById(R.id.news_1)
            edit2 = root.findViewById(R.id.news_verb_1)
            edit3 = root.findViewById(R.id.news_verb_2)
            edit4 = root.findViewById(R.id.news_emotion)

            button.setOnClickListener{
                homeViewModel.news1 = edit1.text.toString()
                homeViewModel.news2 = edit2.text.toString()
                homeViewModel.news3 = edit3.text.toString()
                homeViewModel.news4 = edit4.text.toString()

                val inputMap = hashMapOf<String, String>()
                inputMap[homeViewModel.news2] = "verb"
                inputMap[homeViewModel.news3] = "verb"
                inputMap[homeViewModel.news4] = "adjective"
                homeViewModel.msgRepo.getSynonymList(inputMap)

                navController.navigate(R.id.action_build_message_to_navigation_done)
            }
            root
        }  else {
            val root = inflater.inflate(R.layout.fragment_what, container, false)
            button = root.findViewById(R.id.button)

            edit1 = root.findViewById(R.id.what_detail_1)
            edit2 = root.findViewById(R.id.what_adj_1)
            edit3 = root.findViewById(R.id.what_adv_1)
            edit4 = root.findViewById(R.id.what_adj_2)

            button.setOnClickListener{
                homeViewModel.what1 = edit1.text.toString()
                homeViewModel.what2 = edit2.text.toString()
                homeViewModel.what3 = edit3.text.toString()
                homeViewModel.what4 = edit4.text.toString()

                val inputMap = hashMapOf<String, String>()
                inputMap[homeViewModel.what2] = "verb"
                //inputMap[homeViewModel.what3] = "adverb"
                inputMap[homeViewModel.what4] = "adjective"
                homeViewModel.msgRepo.getSynonymList(inputMap)

                navController.navigate(R.id.action_build_message_to_navigation_done)
            }
            root
        }



    }
}
