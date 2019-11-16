package com.example.jeffryangtoni.audio;

import android.media.AudioManager;
import android.media.MediaPlayer;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;

import java.util.Timer;
import java.util.TimerTask;

public class MainActivity extends AppCompatActivity {

    MediaPlayer mediaPlayer;
    AudioManager audioManager;
    SeekBar scrubBar;
    Timer timer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize audio manager
        audioManager = (AudioManager)getSystemService(AUDIO_SERVICE);

        // Max volume
        int maxVolume = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
        int curVolume = audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);

        SeekBar volumeBar = findViewById(R.id.volumeBar);
        scrubBar = findViewById(R.id.scrubBar);

        volumeBar.setMax(maxVolume);
        volumeBar.setProgress(curVolume);
        volumeBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                Log.i("Volume","Volume: " + Integer.toString(progress));
                audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, progress, 0);
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });

        scrubBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                mediaPlayer.seekTo(progress);
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }
        });

        mediaPlayer = MediaPlayer.create(this, R.raw.naruto_morning);
        scrubBar.setMax(mediaPlayer.getDuration());
        //mediaPlayer.start();
    }

    private void timerCounter() {
        timer = new Timer();
        TimerTask timerTask = new TimerTask() {
            @Override
            public void run() {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        if (mediaPlayer.getCurrentPosition() >= mediaPlayer.getDuration()) {
                            mediaPlayer.stop();
                            scrubBar.setProgress(0);
                            timer.cancel();
                        } else {
                            scrubBar.setProgress(mediaPlayer.getCurrentPosition());
                        }
                    }
                });
            }
        };
        timer.scheduleAtFixedRate(timerTask, 0, 1000);
    }

    public void doFavor(View view) {
        Button button = (Button)view;

        Log.i("[Player]", String.valueOf(mediaPlayer.getDuration()));

        if (button.getTag().equals("play")) {
            mediaPlayer.start();
            timerCounter();
        } else if (button.getTag().equals("pause")) {
            mediaPlayer.pause();
        }
    }
}
