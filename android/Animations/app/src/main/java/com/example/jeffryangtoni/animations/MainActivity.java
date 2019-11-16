package com.example.jeffryangtoni.animations;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    int i = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void fade(View view) {
        Log.i("[info]", "ImageView tapped!!");

        ImageView imgView = findViewById(R.id.imageView);
        ImageView imgView2 = findViewById(R.id.imageView2);

//        if (i == 1) {
//            imgView.animate().alpha(0).setDuration(2000);
//            imgView2.animate().alpha(1).setDuration(2000);
//            i = 0;
//        } else {
//            imgView2.animate().alpha(0).setDuration(2000);
//            imgView.animate().alpha(1).setDuration(2000);
//            i = 1;
//        }

        //imgView.animate().translationXBy(-1500).setDuration(2000);
        //imgView.animate().rotation(1800).alpha(0).setDuration(2000);
        imgView.animate().scaleX(0.5f).scaleY(0.5f).setDuration(2000);
    }
}
