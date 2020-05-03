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

    private lateinit var doneViewModel: DoneViewModel
    lateinit var homeViewModel: HomeViewModel
    lateinit var textView1: TextView
    lateinit var textView2: TextView
    lateinit var textView3: TextView
    lateinit var textView4: TextView

    override fun onCreateView(
            inflater: LayoutInflater,
            container: ViewGroup?,
            savedInstanceState: Bundle?
    ): View? {
        homeViewModel = ViewModelProvider(requireActivity()).get(HomeViewModel::class.java)
        doneViewModel =
                ViewModelProviders.of(this).get(DoneViewModel::class.java)
        doneViewModel.string1 = homeViewModel.how1
        Log.i("HVM", homeViewModel.how1)
        doneViewModel.string2 = homeViewModel.how2
        doneViewModel.string3 = homeViewModel.how3
        doneViewModel.string4 = "help"

        val root = inflater.inflate(R.layout.fragment_done, container, false)
        textView1 = root.findViewById(R.id.Done_1)
        textView2 = root.findViewById(R.id.Done_2)
        textView3 = root.findViewById(R.id.Done_3)
        textView4 = root.findViewById(R.id.Done_4)

        textView1.text = doneViewModel.string1
        textView2.text = doneViewModel.string2
        textView3.text = doneViewModel.string3
        textView4.text = doneViewModel.string4
        return root
    }
}
