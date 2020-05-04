package com.example.replyall

import android.os.Bundle
import android.widget.ImageView
import com.google.android.material.bottomnavigation.BottomNavigationView
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.FragmentManager
import androidx.navigation.NavController
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.setupActionBarWithNavController
import androidx.navigation.ui.setupWithNavController

class MainActivity : AppCompatActivity(), FragmentManager.OnBackStackChangedListener {

    private lateinit var navController : NavController
    private lateinit var bgImage: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val navView: BottomNavigationView = findViewById(R.id.nav_view)

        navController  = findNavController(R.id.nav_host_fragment)
        bgImage = findViewById(R.id.mainBgImage)

        // Passing each menu ID as a set of Ids because each
        // menu should be considered as top level destinations.
        val appBarConfiguration = AppBarConfiguration(setOf(
                R.id.navigation_home, R.id.navigation_done, R.id.navigation_build))
        setupActionBarWithNavController(navController, appBarConfiguration)
        navView.setupWithNavController(navController)
    }

    override fun onBackStackChanged() {

    }

    private fun shouldDisplayHomeUp(){
        val canGoBack = supportFragmentManager.backStackEntryCount > 1
        supportActionBar?.setDisplayHomeAsUpEnabled(canGoBack)
    }

    override fun onSupportNavigateUp(): Boolean {
        navController.navigateUp()
        return true
    }

}
