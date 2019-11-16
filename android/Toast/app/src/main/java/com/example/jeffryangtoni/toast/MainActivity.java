package com.example.jeffryangtoni.toast;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void showToast(View view) {
        EditText txtFullName = findViewById(R.id.txtFullName);
        String fullName = txtFullName.getText().toString();
        String resp = "";

        if (fullName.isEmpty()) {
            resp = "Please insert full name!";
        } else {
            resp = "Hi, " + fullName;
        }

        Log.i("button", "Button just pressed!");
        Toast.makeText(this, resp, Toast.LENGTH_SHORT).show();
    }
}
