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
import com.example.replyall.MainItem
import com.example.replyall.MessageRepository
import com.example.replyall.R
import com.example.replyall.ui.done.DoneViewModel
import com.example.replyall.ui.home.HomeFragment
import com.example.replyall.ui.home.HomeViewModel
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.fragment_self_care.*

class buildFragment : Fragment() {

    private lateinit var notificationsViewModel: buildViewModel
    lateinit var homeViewModel: HomeViewModel
    lateinit var doneViewModel: DoneViewModel

    private lateinit var navController: NavController
    private lateinit var button: Button
    private lateinit var edit1: EditText
    private lateinit var edit2: EditText
    private lateinit var edit3: EditText
    private lateinit var edit4: EditText
    private lateinit var edit1Text : String

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        navController = Navigation.findNavController(requireActivity(), R.id.nav_host_fragment)
        homeViewModel = ViewModelProvider(requireActivity()).get(HomeViewModel::class.java)
        doneViewModel = ViewModelProvider(requireActivity()).get(DoneViewModel::class.java)
        notificationsViewModel =
                ViewModelProviders.of(this).get(buildViewModel::class.java)

        return if(homeViewModel.msgSelected == 1){
            val root = inflater.inflate(R.layout.fragment_how, container, false)
            button = root.findViewById(R.id.button)

            edit1 = root.findViewById(R.id.how_adj_1)
            edit2 = root.findViewById(R.id.how_adj_2)
            edit3 = root.findViewById(R.id.how_detail_1)

            edit1Text = edit1.text.toString()
            homeViewModel.how1 = edit1Text
            homeViewModel.how2 = edit2.text.toString()
            homeViewModel.how3 = edit3.text.toString()

            button.setOnClickListener{
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
                navController.navigate(R.id.action_build_message_to_navigation_done)
            }
            root
        }



    }
}
