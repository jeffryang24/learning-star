package com.example.jeffryangtoni.higherorlower;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import java.util.Random;

public class MainActivity extends AppCompatActivity {

    static final int MAX_TRY = 3;
    Random rnd = new Random();
    int secret;
    int tryCount = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        secret = rnd.nextInt(20) + 1;

        setContentView(R.layout.activity_main);
    }

    public void guessMe(View view) {
        tryCount++;
        String resp;
        EditText txtGuess = findViewById(R.id.txtGuess);
        int guess = Integer.parseInt(txtGuess.getText().toString());

        if (guess == secret) {
            resp = "Hooray!! Banjay!!! Now, try the new one...";
            tryCount = 0;
            secret = rnd.nextInt(20) + 1;
        } else {
            if (tryCount == MAX_TRY) {
                resp = "Oops.. Try again with the new one...";
                tryCount = 0;
                secret = rnd.nextInt(20) + 1;
            } else {
                resp = (guess > secret ? "Lower your guess." : "Higher your guess.") + " You have " + (MAX_TRY - tryCount) + " try left.";
            }
        }

        // clear txtGuess
        txtGuess.setText("");

        Toast.makeText(this, resp, Toast.LENGTH_LONG).show();
    }
}
