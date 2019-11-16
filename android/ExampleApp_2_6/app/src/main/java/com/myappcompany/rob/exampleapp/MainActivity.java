package com.myappcompany.rob.exampleapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void clickFunction(View view) {
        EditText txtEmailAddr = findViewById(R.id.txtEmailAddr);
        EditText txtPassword = findViewById(R.id.txtPassword);
        String email = txtEmailAddr.getText().toString();
        String password = txtPassword.getText().toString();
        String status = "";

        if (email.equals("admin@localhost.dev") && password.equals("admin")) {
            status = "Login Success!";
        } else {
            status = "Login Failed!";
        }

        Log.i("Info", "Button pressed!");
        Log.i("status", status);
    }
}
