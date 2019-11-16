package com.example.jeffryangtoni.image;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    int i = 1;
    ArrayList<Integer> listImages = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        listImages.add(R.drawable.cat4);
        listImages.add(R.drawable.cat1);
        listImages.add(R.drawable.cat2);
        listImages.add(R.drawable.cat3);

        setContentView(R.layout.activity_main);
    }

    public void changeImage(View view) {
        ImageView imgV = findViewById(R.id.imgV);
        imgV.setImageResource(listImages.get(i++));
        if (i == listImages.size()) i = 0;
    }
}
