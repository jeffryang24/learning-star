package com.example.jeffryangtoni.currencyconverter;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void convertCurrency(View view) {
        EditText txtCurrency = findViewById(R.id.txtCurrency);
        String resp;
        Double usd;
        try {
            usd = Double.parseDouble(txtCurrency.getText().toString());
            resp = String.format("£%s is $%.2f", txtCurrency.getText().toString(), convertEurUSD(usd));
        } catch (NumberFormatException ex) {
            resp = "Please insert currency";
        }

        Toast.makeText(this, resp, Toast.LENGTH_LONG).show();
    }

    private Double convertEurUSD(Double usd) {
        return usd * 1.3;
    }
}
