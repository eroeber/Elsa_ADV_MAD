package com.example.replyall.ui.home

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import androidx.navigation.NavController
import androidx.navigation.Navigation
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.replyall.MainItem
import com.example.replyall.MessageRepository
import com.example.replyall.R
import com.example.replyall.ui.buildMessage.buildFragment

class HomeFragment : Fragment(), MainRecyclerAdapter.MessageItemListener {
    lateinit var homeViewModel: HomeViewModel

    private val message0: String = "How are you?"
    private val message1: String = "What are you doing today?"
    private val message2: String = "How are you staying sane & practicing self care?"
    private val message3: String = "Did you see the news today?"
    private val message4: String = "What’s new?"

    private lateinit var main_recyclerView: RecyclerView
    private lateinit var navController: NavController
    private val messageList = testMessageList()
    private lateinit var selectedItem : MainItem
    private var bf = buildFragment()

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        navController = Navigation.findNavController(requireActivity(), R.id.nav_host_fragment)
        homeViewModel = ViewModelProvider(requireActivity()).get(HomeViewModel::class.java)
        val root = inflater.inflate(R.layout.fragment_home, container, false)
        main_recyclerView = root.findViewById(R.id.main_recyclerView)
      //  homeViewModel.text.observe(viewLifecycleOwner, Observer {

            main_recyclerView.adapter =
                MainRecyclerAdapter(
                    messageList,
                    this
                )
           main_recyclerView.layoutManager = LinearLayoutManager(requireContext())
            main_recyclerView.setHasFixedSize(true)
      //  })


        return root
    }

    private fun testMessageList(): List<MainItem>{
        val list = ArrayList<MainItem>()
        val item1 = MainItem("$message0")
        val item2 = MainItem("$message1")
        val item3 = MainItem("$message2")
        val item4 = MainItem("$message3")
        val item5 = MainItem("$message4")
        list += item1
        list += item2
        list += item3
        list += item4
        list += item5
        return list
    }

    override fun onMessageItemClick(mainItem: MainItem) {
        Log.i("Message tapped:", mainItem.toString())
        selectedItem = mainItem
        if(mainItem.messageText == message0){
            homeViewModel.msgSelected = 1
        } else if(mainItem.messageText == message1){
            homeViewModel.msgSelected = 2
        } else if(mainItem.messageText == message2){
            homeViewModel.msgSelected = 3
        } else if(mainItem.messageText == message3){
            homeViewModel.msgSelected = 4
        } else if(mainItem.messageText == message4){
            homeViewModel.msgSelected = 5
        }


        navController.navigate(R.id.action_navigation_home_to_build_message)
    }
}
