package com.example.jeffryangtoni.gameconnect3;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TableRow;
import android.widget.TextView;

import java.util.Arrays;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    ImageView imgView1, imgView2, imgView3, imgView4, imgView5, imgView6, imgView7, imgView8, imgView9;
    TextView txtStatus;
    Button btnPlayAgain;
    List<ImageView> listImgView;
    boolean isRed = true;
    boolean noResponse = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imgView1 = findViewById(R.id.img1);
        imgView2 = findViewById(R.id.img2);
        imgView3 = findViewById(R.id.img3);
        imgView4 = findViewById(R.id.img4);
        imgView5 = findViewById(R.id.img5);
        imgView6 = findViewById(R.id.img6);
        imgView7 = findViewById(R.id.img7);
        imgView8 = findViewById(R.id.img8);
        imgView9 = findViewById(R.id.img9);

        txtStatus = findViewById(R.id.txtStatus);
        btnPlayAgain = findViewById(R.id.btnPlayAgain);

        listImgView = Arrays.asList(imgView1, imgView2, imgView3, imgView4, imgView5, imgView6, imgView7, imgView8, imgView9);
    }

    public void onClick_HandleImage(View view) {
        ImageView imgView = (ImageView)view;
        if (!noResponse && imgView.getTag() == null) {
            imgView.setTranslationY(-200);
            imgView.setImageResource(isRed ? R.drawable.red : R.drawable.yellow);
            imgView.setTag(isRed ? R.drawable.red : R.drawable.yellow);
            imgView.animate().translationYBy(200).setDuration(500);
            isRed = !isRed;
        }

        if (checkWinner()) {
            if (txtStatus.getVisibility() != View.VISIBLE) {
                txtStatus.setText(txtStatus.getText().toString().replace("[TEAM]", !isRed ? "Red" : "Yellow"));

                txtStatus.setVisibility(View.VISIBLE);
                btnPlayAgain.setVisibility(View.VISIBLE);
            }

            noResponse = true;
        } else if (isGameOver()) {
            if (txtStatus.getVisibility() != View.VISIBLE) {
                txtStatus.setText("Game Over. No one win this game.");

                txtStatus.setVisibility(View.VISIBLE);
                btnPlayAgain.setVisibility(View.VISIBLE);
            }

            noResponse = true;
        }
    }

    private boolean checkWinner() {
        int[][] winSolution = {
                {0, 1, 2},
                {3, 4, 5},
                {6, 7, 8},
                {0, 3, 6},
                {1, 4, 7},
                {2, 5, 8},
                {0, 4, 8},
                {2, 4, 6}
        };

        for (int i=0; i<winSolution.length; i++) {
            int[] tmp = winSolution[i];
            if (listImgView.get(tmp[0]).getTag() != null && listImgView.get(tmp[0]).getTag().equals(listImgView.get(tmp[1]).getTag()) && listImgView.get(tmp[0]).getTag().equals(listImgView.get(tmp[2]).getTag())) {
                return true;
            }
        }

        return false;
    }

    public void playAgain(View view) {
        TableRow tblRow1 = findViewById(R.id.tblRow1);
        for(int i=0; i<tblRow1.getChildCount(); i++) {
            View v = tblRow1.getChildAt(i);

            if (v instanceof ImageView) {
                ImageView vw = (ImageView)v;
                vw.setTag(null);
                vw.setImageDrawable(null);
            }
        }

        TableRow tblRow2 = findViewById(R.id.tblRow2);
        for(int i=0; i<tblRow2.getChildCount(); i++) {
            View v = tblRow2.getChildAt(i);

            if (v instanceof ImageView) {
                ImageView vw = (ImageView)v;
                vw.setTag(null);
                vw.setImageDrawable(null);
            }
        }

        TableRow tblRow3 = findViewById(R.id.tblRow3);
        for(int i=0; i<tblRow3.getChildCount(); i++) {
            View v = tblRow3.getChildAt(i);

            if (v instanceof ImageView) {
                ImageView vw = (ImageView)v;
                vw.setTag(null);
                vw.setImageDrawable(null);
            }
        }

        // Reset isRed
        isRed = true;

        // Reset no response
        noResponse = false;

        // Hide up panel
        txtStatus.setVisibility(View.INVISIBLE);
        txtStatus.setText("[TEAM] has won!");
        btnPlayAgain.setVisibility(View.INVISIBLE);
    }

    public boolean isGameOver() {
        int filled = 0;

        TableRow tblRow1 = findViewById(R.id.tblRow1);
        for(int i=0; i<tblRow1.getChildCount(); i++) {
            View v = tblRow1.getChildAt(i);

            if (v instanceof ImageView) {
                ImageView vw = (ImageView)v;
                if (vw.getTag() != null) filled++;
            }
        }

        TableRow tblRow2 = findViewById(R.id.tblRow2);
        for(int i=0; i<tblRow2.getChildCount(); i++) {
            View v = tblRow2.getChildAt(i);

            if (v instanceof ImageView) {
                ImageView vw = (ImageView)v;
                if (vw.getTag() != null) filled++;
            }
        }

        TableRow tblRow3 = findViewById(R.id.tblRow3);
        for(int i=0; i<tblRow3.getChildCount(); i++) {
            View v = tblRow3.getChildAt(i);

            if (v instanceof ImageView) {
                ImageView vw = (ImageView)v;
                if (vw.getTag() != null) filled++;
            }
        }

        if (filled == 9) return true;
        else return false;
    }
}
